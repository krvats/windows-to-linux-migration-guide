# 12. Long-term maintenance

*Last reviewed: 2026-10-27*

## Weekly

- Update the system (Arch-based: `sudo pacman -Syu`). Do not power off during updates.
- Read the distro's news page before big updates on rolling distros (Arch has one at archlinux.org/news).
- Reboot after kernel or driver updates.

## Monthly

- Back up projects and saves (Ludusavi can do saves).
- Check disk health (`smartctl -a /dev/nvme0` from smartmontools) and free space.

## Snapshots

- **btrfs:** Snapper or Timeshift in btrfs mode. Take a snapshot before big changes.
- **ext4:** Timeshift in rsync mode.

## Keep config safe

Put your dotfiles in a private Git repo. A reinstall then takes minutes.

## After 4 weeks: can I wipe the backup?

Tick all:
- [ ] Every game I care about starts and has its progress
- [ ] Projects open and work
- [ ] Apps I need run
- [ ] I have had no data surprises for 4 weeks
- [ ] I have a second copy of irreplaceable files

Only then reuse or return the backup drive.

## Switching distros later

1. Keep `/home` and games on separate partitions.
2. Reinstall the system partition only.
3. Restore dotfiles from Git.
