# Windows to Linux Migration Guide: Switch Without Losing Games, Saves or Files

> **A complete, step-by-step guide to moving from Windows to Linux (single OS or dual boot) without losing your games, game saves, projects or settings.**
> Written for gamers, video editors, game developers, programmers, designers, students and anyone on a tight budget or slow internet.

![License: MIT](https://img.shields.io/badge/license-MIT-green)
![Last updated](https://img.shields.io/badge/last%20updated-2026--10--27-blue)
![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)
![Beginner friendly](https://img.shields.io/badge/level-beginner%20friendly-orange)

**Keywords:** Windows to Linux, migrate Windows to Linux, dual boot, backup before installing Linux, keep game saves, Steam Proton, Ludusavi, CachyOS, EndeavourOS, Rescuezilla, Caelestia, Hyprland, Linux for gamers, Linux for video editors, Linux for game developers, low bandwidth Linux install, switch to Linux on a budget.

---

## Who this is for

| You are... | You will find... |
|---|---|
| A **gamer** with a huge library and slow internet | How to move Steam/Epic/GOG games and saves without re-downloading |
| A **video editor / designer** | Which apps work on Linux, which do not, and what to use instead |
| A **game dev / programmer** | Godot, Unity, Unreal, Blender, VS Code, Docker and AI tools on Linux |
| A **student** or someone on a **budget** | How to switch with one drive, no new hardware and no data loss |
| A **complete beginner** | Plain-language steps, tick boxes, and "stop here if" warnings |
| Someone **sharing a drive** with a friend or family | How to make room safely without touching other people's files |

## The idea in one minute

1. **Check** that your apps and games work on Linux (10 minutes).
2. **Try** Linux from a USB stick first (zero risk).
3. **Back up** by plain copy (and optionally a full disk image).
4. **Install** Linux.
5. **Restore** your games, saves and files.
6. **Customize** (themes, tiling window managers, shells).
7. **Keep your backup for 4 weeks** before you delete anything.

## Start here

| Step | Document |
|---|---|
| 0 | [Should you switch? App and game check](docs/00-start-here.md) |
| 1 | [Choose your path: single OS or dual boot](docs/01-choose-your-path.md) |
| 2 | [Pre-flight checklist](docs/02-preflight-checklist.md) |
| 3 | [Backup strategies (plain copy, disk image, saves)](docs/03-backup-strategies.md) |
| 4 | [Choose a Linux distribution](docs/04-choose-a-distro.md) |
| 5 | [Try Linux from a USB stick](docs/05-try-live-usb.md) |
| 6 | [Install guide](docs/06-install-guide.md) |
| 7 | [Restore games, saves and files](docs/07-restore-games-and-saves.md) |
| 8 | [Apps by field (gaming, editing, dev, design, study)](docs/08-apps-by-field.md) |
| 9 | [Customization: Caelestia, Hyprland and themes](docs/09-customization.md) |
| 10 | [Slow or limited internet guide](docs/10-low-bandwidth.md) |
| 11 | [Low storage, shared drives and partition tricks](docs/11-low-storage-and-shared-drives.md) |
| 12 | [Long-term maintenance](docs/12-maintenance.md) |
| 13 | [Troubleshooting](docs/13-troubleshooting.md) |
| 14 | [FAQ](docs/14-faq.md) |
| - | [Glossary](docs/glossary.md) |
| - | [My journey (real decisions and mistakes)](docs/my-journey.md) |

## Automation scripts (Windows PowerShell)

| Script | What it does |
|---|---|
| [`scripts/backup-windows.ps1`](scripts/backup-windows.ps1) | One command: finds your Steam libraries, copies your user profile and game folders to a backup drive, and runs Ludusavi if installed. Has a dry-run mode. |
| [`scripts/verify-copy.ps1`](scripts/verify-copy.ps1) | Compares file counts and sizes between the original and the copy. |

Quick use (PowerShell):

```powershell
# Preview first (copies nothing)
.\scripts\backup-windows.ps1 -Destination "E:\Backup" -IncludeUserProfile -DryRun

# Real run
.\scripts\backup-windows.ps1 -Destination "E:\Backup" -IncludeUserProfile
```

## Golden rules

1. **Back up first, erase last.** Never click "Erase disk" until the backup is checked.
2. **Unplug other drives during install** so the installer cannot touch them.
3. **Never format, delete or resize a drive that is not yours** without the owner's permission.
4. **Keep the backup for 4 weeks** after switching.
5. **If a screen looks different from the guide, stop.** Take a photo and ask.

## Honest limits

- Adobe Premiere, After Effects, Photoshop and Illustrator do **not** run on Linux. Read [docs/00-start-here.md](docs/00-start-here.md) first.
- Some online games with kernel-level anti-cheat do not run on Linux. Check [AreWeAntiCheatYet](https://areweanticheatyet.com) and [ProtonDB](https://www.protondb.com) before you switch.
- Linux changes fast. Every document has a "Last reviewed" date. If something is outdated, please open an issue.

## Contributing

Corrections and new sections (other distros, other languages, other fields) are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE). Use it, translate it, share it.
