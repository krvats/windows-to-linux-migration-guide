# 13. Troubleshooting

*Last reviewed: 2026-10-27*

| Problem | Try |
|---|---|
| USB does not appear in boot menu | Recreate with GPT, try another USB port (USB 2.0), disable Fast Boot in BIOS |
| "Secure Boot violation" | Disable Secure Boot, or use a distro with signed boot |
| Black screen after boot (NVIDIA) | Boot the NVIDIA entry of the live USB, install the driver, update, reboot |
| No Wi-Fi | USB-tether your phone, then install the driver package for your chipset |
| Windows missing from boot menu (dual boot) | Re-run the bootloader update (`sudo grub-mkconfig -o /boot/grub/grub.cfg` on GRUB systems) |
| Game will not start | Try another Proton version; check ProtonDB for launch options |
| Saves missing | Run the game once, close, restore Ludusavi again |
| Online game blocked | Check AreWeAntiCheatYet; play offline |
| Audio crackling | Update PipeWire; check sample rate |
| Screen tearing | Enable VRR or the compositor's sync options |
| Update broke something | Roll back from a snapshot |
| Backup drive does not mount | Install NTFS support (`ntfs-3g` or kernel NTFS), check it was shut down cleanly in Windows, disable Fast Startup |
| Copy is slow | HDDs copy at about 80 to 150 MB/s. Hundreds of GB take hours. Let it run |

## How to ask for help well

Include: distro and version, hardware (CPU, GPU), what you did, the exact error (a photo of the screen is fine), and what you already tried.

## Useful places

Arch Wiki (excellent for any distro), your distro's forum, ProtonDB, r/linux_gaming, r/linuxquestions.
