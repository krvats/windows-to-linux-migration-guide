# 07. Restore games, saves and files

*Last reviewed: 2026-10-27*

## Order of work

1. Files and projects
2. Game libraries
3. Run each game once
4. Restore saves
5. Test

## 1. Files and projects

Copy from the backup drive into your home folder (`~`). Use the file manager. Keep the same folder names so you find things.

## 2. Game libraries (no re-downloading)

> **Rule:** put games on the **Linux drive** (ext4 or btrfs), not on an NTFS drive. Proton and Wine often crash or misbehave on NTFS.

### Steam

1. Copy the backed-up `steamapps` folder into a new folder, for example `~/Games/SteamLibrary/steamapps`.
2. Open Steam, log in.
3. Settings, Compatibility, enable **Steam Play for all other titles**, pick Proton Experimental (or a newer Proton).
4. Settings, Storage, add a drive/library and choose `~/Games/SteamLibrary`.
5. Steam recognizes the games from the `appmanifest_*.acf` files. A small update or verify is normal.

### Epic and GOG

Install **Heroic Games Launcher**, log in, and use its import option to point at the copied game folder.

### Games with no launcher

In Steam: Games, **Add a Non-Steam Game**, choose the `.exe`, then Properties, Compatibility, force a Proton version. For stubborn ones use **Lutris** or **Bottles**.

## 3. Run each game once

Launch the game, wait for the main menu, close it. This creates the Proton folder (called a **prefix**) where the game looks for saves.

## 4. Restore saves

Use **Ludusavi** (install from your distro's store or Flatpak):

1. Settings: add the backup folder.
2. Add Steam as a root so Ludusavi knows where Proton prefixes live.
3. Switch to Restore, select games, restore.

Manual way: saves live inside the game's Proton prefix, in `compatdata/<appid>/pfx/drive_c/users/steamuser/...`. [PCGamingWiki](https://www.pcgamingwiki.com) lists each game's Windows and Linux save paths.

## 5. Test

Test five games and three projects before you change anything else.

## If a game fails

| Problem | Try |
|---|---|
| Will not start | Properties, Compatibility, try another Proton (Experimental or GE-Proton) |
| No saves shown | Run once, close, restore saves again |
| Online mode blocked | Play offline, or check AreWeAntiCheatYet |
| Crashes on NTFS | Move the game to ext4 or btrfs |
| Stutter | Update GPU driver, turn on shader pre-caching in Steam |

The original is still on your backup drive, so you can always try again.
