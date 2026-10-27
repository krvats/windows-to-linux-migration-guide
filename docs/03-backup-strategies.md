# 03. Backup strategies

*Last reviewed: 2026-10-27*

Use **both** of these if you have the space, and at least the first one if you do not.

## Strategy 1: Plain copy (most important)

Normal files you can open from Linux without any special tool.

What to copy:
- Your **user profile**: `C:\Users\<YourName>` (Desktop, Documents, Downloads, Pictures, Videos, Saved Games, AppData)
- Each **game library** (for Steam: the whole `steamapps` folder, which includes the small `appmanifest_*.acf` files)
- **Projects, AI models, tools, music, anything you made**

### Automatic way

Use the script in this repo:

```powershell
.\scripts\backup-windows.ps1 -Destination "E:\Backup" -IncludeUserProfile -DryRun   # preview
.\scripts\backup-windows.ps1 -Destination "E:\Backup" -IncludeUserProfile           # real
```

It finds your Steam libraries by itself, copies them, and runs Ludusavi if installed.

### Manual way (one folder)

```powershell
robocopy "C:\Users\YourName" "E:\Backup\User" /E /XJ /R:1 /W:1 /LOG:"E:\Backup\user-log.txt"
robocopy "D:\SteamLibrary\steamapps" "E:\Backup\Games\Steam\steamapps" /E /XJ /R:1 /W:1
```

- `/E` copies all subfolders, `/XJ` skips junction links that cause loops, `/R:1 /W:1` retries once.
- "Access denied" on a few files inside AppData is normal.
- Robocopy exit codes **0 to 7 are success**; 8 or higher means errors. See the log.

### Check the copy

```powershell
.\scripts\verify-copy.ps1 -Source "D:\SteamLibrary\steamapps" -Copy "E:\Backup\Games\Steam\steamapps"
```

Or right-click both folders, Properties, and compare **Size** and **file count**. Then open a few files.

## Strategy 2: Game saves with Ludusavi

[Ludusavi](https://github.com/mtkennerly/ludusavi) scans for the save locations of thousands of games (AppData, Documents, Saved Games) and backs them up. Check its settings for the Linux/Proton restore options later. You can also look up a save path on [PCGamingWiki](https://www.pcgamingwiki.com).

## Strategy 3: Full disk image (undo button)

Tools: [Rescuezilla](https://rescuezilla.com) or [Clonezilla](https://clonezilla.org).

- Makes a compressed copy of the whole drive. If the switch goes wrong you can restore Windows exactly.
- **Always run Verify** afterwards, and open the image once in Image Explorer.
- Needs about as much free space as your **used** space, in **one place**.
- To pull single files out later you need to boot Rescuezilla again. That is why Strategy 1 matters more.

## Space table

| Free space on backup drive | Do this |
|---|---|
| About 2x your used space | Plain copy **and** disk image |
| About 1x used space or a bit less | Plain copy of data only (skip the image) |
| Much less | Cut the list (leave out re-downloadable games), or use two drives |

## The 3-2-1 idea (simple version)

Keep **3** copies of anything irreplaceable, on **2** kinds of storage, with **1** somewhere else (cloud or a friend's house). Saves, projects and notes are small. Do it for those.

> **Warning:** One copy on one hard drive is not a backup you can trust. Hard drives fail.
