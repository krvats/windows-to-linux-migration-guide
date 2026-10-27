# 05. Try Linux from a USB stick (zero risk)

*Last reviewed: 2026-10-27*

A **live USB** runs Linux from the stick. It installs nothing and changes nothing on your drives.

## Make the stick

1. Download the ISO of your chosen distro.
2. Open **Rufus** (rufus.ie). Select your USB and the ISO.
3. Partition scheme: **GPT**. Click START.
4. If asked for **ISO mode or DD mode**, follow the distro's instructions. DD mode is commonly recommended for Arch-based ISOs.

> **Warning:** Rufus erases the USB stick.

## Boot it

1. Restart and tap the **boot menu key** (F12, F11, F10, F8 or Esc, depending on the brand).
2. Disable **Secure Boot** in the BIOS if your distro requires it (CachyOS does).
3. Pick the USB from the menu.
4. If you have an NVIDIA GPU and the boot menu offers a "nvidia" entry, pick it.

## What to test (10 minutes)

- [ ] Wi-Fi connects (if not, tether your phone with a USB cable)
- [ ] Sound works
- [ ] Screen resolution is right, and refresh rate if you have a fast monitor
- [ ] Keyboard, mouse and trackpad work
- [ ] Bluetooth and webcam (if you use them)
- [ ] You like how it feels

Then shut down and remove the USB. Windows is untouched.

> If something important fails here, it will fail after install too. Fix or choose a different distro before you erase anything.
