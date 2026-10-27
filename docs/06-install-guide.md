# 06. Install guide

*Last reviewed: 2026-10-27. Written around CachyOS. Other distros have similar installers (Calamares or their own). Follow your distro's official guide for exact menu names.*

## Before you click Install

- [ ] Backup finished and **verified** ([03](03-backup-strategies.md))
- [ ] Windows to-dos done ([02](02-preflight-checklist.md))
- [ ] **Backup drives and any drive that is not yours are unplugged.** Only the target drive and the USB stay connected.

## Steps (single OS, erase the whole target drive)

1. Boot the live USB ([05](05-try-live-usb.md)).
2. Start the installer. If offered **Offline** vs **Online** install, choose **Offline** when internet is slow.
3. Language, time zone, keyboard.
4. Disk: choose **Erase disk** and select the correct drive. Check the **size and model** twice.
5. File system: **btrfs** (snapshots protect you from bad updates) or **ext4** (simplest). Pick one and keep the default swap.
6. **Do not enable disk encryption** unless you understand password recovery. Forget the password and the data is gone.
7. Desktop: choose a stable desktop (KDE Plasma or GNOME) first. Add Hyprland or Caelestia later, once everything works.
8. Create a user and a strong password.
9. Install, reboot, remove the USB.

## Steps (dual boot, keep Windows)

1. Shrink Windows' partition in Disk Management first. Leave the space **unallocated**.
2. In the installer choose **manual partitioning**.
3. Select **only the free space**. Create `/` (ext4 or btrfs). Optionally create a separate `/home`.
4. Reuse the existing **EFI System Partition**: mount it at `/boot/efi` (or `/efi`) and **do not format it**.
5. Use a bootloader that detects Windows (GRUB, or the distro's default).

## First boot

```bash
# Arch-based (CachyOS, EndeavourOS, Arch)
sudo pacman -Syu
```

- If the internet drops, run the same command again. It continues.
- Reboot after big updates.

### Gaming packages (CachyOS)

```bash
sudo pacman -S cachyos-gaming-meta cachyos-gaming-applications
```

If a package name is not found, use the distro's own welcome app (CachyOS Hello) or its wiki. Names change.

### Other families

| Family | Update command |
|---|---|
| Debian / Ubuntu / Mint | `sudo apt update && sudo apt upgrade` |
| Fedora / Nobara | `sudo dnf upgrade` |
| openSUSE | `sudo zypper dup` |

### Graphics drivers

- **AMD / Intel:** usually work out of the box.
- **NVIDIA:** follow your distro's NVIDIA page (Mint and Ubuntu: Driver Manager; Pop!_OS: NVIDIA ISO; Arch-based: installer or wiki).

## Verify the install

- [ ] It boots without the USB
- [ ] Wi-Fi works
- [ ] GPU driver is loaded (games and video play smoothly)
- [ ] Sound works
- [ ] You can see your backup drive in the file manager
