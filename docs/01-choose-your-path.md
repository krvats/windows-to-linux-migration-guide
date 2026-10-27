# 01. Choose your path: single OS or dual boot

*Last reviewed: 2026-10-27*

## The four paths

| Path | What it is | Best for | Risk to your data |
|---|---|---|---|
| **A. Second drive for Linux** | Add a drive, install Linux on it, leave Windows alone | People who can afford a drive | Lowest |
| **B. Dual boot on one drive** | Shrink Windows, put Linux in the free space | One drive, want both OS | Low to medium |
| **C. Linux only** | Back up everything, erase, install Linux | Want one OS long term | Safe **only if** backup is verified |
| **D. Virtual machine or WSL** | Run Linux inside Windows | Testing, development | None, but no full desktop or gaming speed |

## How to choose

1. Do you depend on a Windows-only app? Choose A or B (see [00](00-start-here.md)).
2. Can you spend money on a second drive? Choose A (it is the safest of all).
3. Is storage tight and you want one clean OS? Choose C, with a verified backup.
4. Just curious? Start with the live USB ([05](05-try-live-usb.md)). It changes nothing.

## Single OS (Path C) in one picture

```
Backup (plain copy + optional image)  ->  Verify  ->  Install Linux  ->  Restore  ->  Keep backup 4 weeks
```

## Dual boot (Path B) notes

- Keep Windows' own EFI partition; let the Linux installer reuse it **without formatting**.
- Install Windows first, Linux second.
- Windows updates can sometimes change the boot order. Know how to open your BIOS boot menu.
- Use **ext4 or btrfs** for Linux games, not NTFS.

> **Warning:** On a dual boot, never choose "Erase disk" in the installer. Choose manual partitioning and select only the free space.
