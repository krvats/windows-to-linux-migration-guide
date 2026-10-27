<#
.SYNOPSIS
  Compares an original folder and its copy by file count and total size.
  Part of windows-to-linux-migration-guide.

.EXAMPLE
  .\verify-copy.ps1 -Source "D:\SteamLibrary\steamapps" -Copy "E:\Backup\Games\Steam\lib0\steamapps"

.NOTES
  This is a quick sanity check, not a byte-by-byte comparison.
  Run it on game and project folders. Do not run it on the whole user profile
  (AppData has links and locked files that make counts differ).
  Always also open a few files from the copy.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$Source,
    [Parameter(Mandatory = $true)][string]$Copy
)

function Get-FolderStats([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path)) { return $null }
    $files = Get-ChildItem -LiteralPath $Path -Recurse -File -Force -ErrorAction SilentlyContinue
    $m = $files | Measure-Object -Property Length -Sum
    [pscustomobject]@{
        Files = [int64]$m.Count
        Bytes = [int64]$m.Sum
    }
}

Write-Host "Scanning source..."
$a = Get-FolderStats $Source
Write-Host "Scanning copy..."
$b = Get-FolderStats $Copy

if (-not $a) { Write-Error "Source not found: $Source"; exit 2 }
if (-not $b) { Write-Error "Copy not found: $Copy"; exit 2 }

"{0,-10} {1,14} {2,16}" -f '', 'Files', 'Size (GB)'
"{0,-10} {1,14:N0} {2,16:N2}" -f 'Source', $a.Files, ($a.Bytes / 1GB)
"{0,-10} {1,14:N0} {2,16:N2}" -f 'Copy',   $b.Files, ($b.Bytes / 1GB)

if ($a.Files -eq $b.Files -and $a.Bytes -eq $b.Bytes) {
    Write-Host "MATCH: file count and size are identical." -ForegroundColor Green
    exit 0
} else {
    Write-Host "DIFFERENT: file count or size does not match." -ForegroundColor Yellow
    Write-Host "Check the robocopy log for failed files, then run the copy again (robocopy skips files that are already identical)."
    exit 1
}
