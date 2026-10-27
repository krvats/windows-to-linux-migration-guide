<#
.SYNOPSIS
  Copies your Steam libraries, user profile and other game folders to a backup drive
  before you switch from Windows to Linux. Part of windows-to-linux-migration-guide.

.DESCRIPTION
  - Finds your Steam libraries automatically (registry + libraryfolders.vdf).
  - Optionally copies your whole user profile (-IncludeUserProfile).
  - Copies common Epic/GOG folders if they exist.
  - Copies any extra folders you list with -ExtraFolders.
  - Runs Ludusavi (game save backup) if it is installed and on PATH.
  - Never deletes anything. It only copies (robocopy without /MIR or /PURGE).
  - Use -DryRun first: it lists what would be copied and copies nothing.

.PARAMETER Destination
  Folder on the backup drive, for example E:\Backup

.PARAMETER IncludeUserProfile
  Also copy C:\Users\<you> (Desktop, Documents, Pictures, Saved Games, AppData...).

.PARAMETER ExtraFolders
  Extra folders to copy, for example "D:\Projects","D:\AI".

.PARAMETER DryRun
  Preview only.

.EXAMPLE
  .\backup-windows.ps1 -Destination "E:\Backup" -IncludeUserProfile -DryRun
  .\backup-windows.ps1 -Destination "E:\Backup" -IncludeUserProfile -ExtraFolders "D:\Projects"

.NOTES
  Robocopy exit codes 0-7 are success. 8 or higher means some files failed.
  Some "Access denied" lines inside AppData are normal.
  Review the script before running it. You are responsible for your own data.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Destination,
    [switch]$IncludeUserProfile,
    [string[]]$ExtraFolders = @(),
    [switch]$DryRun
)

$ErrorActionPreference = 'Continue'

if (-not (Test-Path -LiteralPath $Destination)) {
    New-Item -ItemType Directory -Path $Destination -Force | Out-Null
}
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$log = Join-Path $Destination "backup-log-$stamp.txt"
$problems = New-Object System.Collections.Generic.List[string]

function Invoke-SafeCopy {
    param(
        [string]$Source,
        [string]$Target,
        [string[]]$ExcludeDirs = @()
    )
    if (-not (Test-Path -LiteralPath $Source)) {
        Write-Warning "Skipping (not found): $Source"
        return
    }
    Write-Host ""
    Write-Host "Copying: $Source"
    Write-Host "     to: $Target"
    $roboArgs = @($Source, $Target, '/E', '/XJ', '/R:1', '/W:1', '/NP', "/LOG+:$log")
    if ($ExcludeDirs.Count -gt 0) { $roboArgs += '/XD'; $roboArgs += $ExcludeDirs }
    if ($DryRun) { $roboArgs += '/L' }
    & robocopy @roboArgs | Out-Null
    $code = $LASTEXITCODE
    if ($code -ge 8) {
        Write-Warning "robocopy exit code $code for $Source. Some files failed. See the log."
        $problems.Add("$Source (exit $code)")
    } else {
        Write-Host "OK (robocopy exit code $code)"
    }
}

Write-Host "Destination : $Destination"
Write-Host "Log file    : $log"
if ($DryRun) { Write-Host "MODE        : DRY RUN (nothing is copied)" -ForegroundColor Yellow }

# Free space on destination drive
try {
    $driveLetter = (Split-Path -Qualifier $Destination).TrimEnd(':')
    $free = (Get-PSDrive -Name $driveLetter -ErrorAction Stop).Free
    Write-Host ("Free space on {0}: : {1:N0} GB" -f $driveLetter, ($free / 1GB))
} catch {
    Write-Warning "Could not read free space for the destination."
}

# 1. Steam libraries
$steamRoot = $null
try { $steamRoot = (Get-ItemProperty 'HKCU:\Software\Valve\Steam' -ErrorAction Stop).SteamPath } catch {}
$libraries = @()
if ($steamRoot) {
    $steamRoot = $steamRoot -replace '/', '\'
    $libraries += $steamRoot
    $vdf = Join-Path $steamRoot 'steamapps\libraryfolders.vdf'
    if (Test-Path -LiteralPath $vdf) {
        Get-Content -LiteralPath $vdf | ForEach-Object {
            if ($_ -match '"path"\s+"([^"]+)"') {
                $libraries += ($Matches[1] -replace '\\\\', '\')
            }
        }
    }
    $libraries = $libraries | Select-Object -Unique
    Write-Host ""
    Write-Host "Steam libraries found:"
    $libraries | ForEach-Object { Write-Host "  $_" }
} else {
    Write-Warning "Steam not found in the registry. Use -ExtraFolders to add your game folders."
}

$i = 0
foreach ($lib in $libraries) {
    $apps = Join-Path $lib 'steamapps'
    Invoke-SafeCopy -Source $apps -Target (Join-Path $Destination "Games\Steam\lib$i\steamapps")
    $i++
}

# 2. Other launchers (best effort, common default paths)
$otherGameFolders = @(
    @{ Src = 'C:\Program Files\Epic Games';                 Dst = 'Games\Epic' },
    @{ Src = 'C:\GOG Games';                                Dst = 'Games\GOG' },
    @{ Src = 'C:\Program Files (x86)\GOG Galaxy\Games';     Dst = 'Games\GOG-Galaxy' }
)
foreach ($g in $otherGameFolders) {
    if (Test-Path -LiteralPath $g.Src) {
        Invoke-SafeCopy -Source $g.Src -Target (Join-Path $Destination $g.Dst)
    }
}

# 3. User profile
if ($IncludeUserProfile) {
    $profile = $env:USERPROFILE
    $excludes = @(
        (Join-Path $profile 'AppData\Local\Temp'),
        (Join-Path $profile 'AppData\Local\Microsoft\Windows\INetCache')
    )
    Invoke-SafeCopy -Source $profile -Target (Join-Path $Destination 'UserProfile') -ExcludeDirs $excludes
    Write-Host "Note: if OneDrive 'files on demand' is on, copying can download cloud-only files." -ForegroundColor Yellow
}

# 4. Extra folders
foreach ($f in $ExtraFolders) {
    $name = Split-Path -Leaf $f
    if ([string]::IsNullOrWhiteSpace($name)) { $name = ($f -replace '[:\\]', '_') }
    Invoke-SafeCopy -Source $f -Target (Join-Path $Destination "Extra\$name")
}

# 5. Ludusavi (game saves)
$ludusavi = Get-Command ludusavi -ErrorAction SilentlyContinue
if ($ludusavi) {
    Write-Host ""
    if ($DryRun) {
        Write-Host "Ludusavi found. Skipping save backup in dry-run mode."
    } else {
        Write-Host "Running Ludusavi save backup..."
        & ludusavi backup --force --path (Join-Path $Destination 'Saves')
        if ($LASTEXITCODE -ne 0) {
            Write-Warning "Ludusavi returned exit code $LASTEXITCODE. Run 'ludusavi backup --help' and check its settings."
            $problems.Add("Ludusavi (exit $LASTEXITCODE)")
        }
    }
} else {
    Write-Warning "Ludusavi not found on PATH. Open the Ludusavi app and back up saves manually to $Destination\Saves"
}

Write-Host ""
Write-Host "================ SUMMARY ================"
if ($problems.Count -eq 0) {
    Write-Host "No errors reported." -ForegroundColor Green
} else {
    Write-Host "Some items had problems:" -ForegroundColor Yellow
    $problems | ForEach-Object { Write-Host "  - $_" }
}
Write-Host "Next: run verify-copy.ps1 on your important folders, then open a few files from the copy."
Write-Host "Log: $log"
