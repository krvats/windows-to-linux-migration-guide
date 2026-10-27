# 10. Slow or limited internet guide

*Last reviewed: 2026-10-27*

You can switch with slow internet. The trick is to **move the big downloads to the places with good internet** and avoid re-downloading games.

## Do the big downloads elsewhere

- Download the ISO (2 to 6 GB) at a library, school, cafe, friend's home, or overnight.
- Many distros offer **torrents**, which resume if the connection drops.
- Use a download manager that resumes (aria2, Free Download Manager).
- Check the **checksum** (SHA256) shown on the distro site so a damaged download does not waste your time:

```powershell
Get-FileHash .\distro.iso -Algorithm SHA256
```

## Never re-download games

- Copy the `steamapps` folder to Linux ([07](07-restore-games-and-saves.md)).
- Steam only fetches small missing pieces.
- Keep a list of games you will **not** play and leave them out of the backup.

## Use the offline installer

If the installer offers Offline, pick it. It installs from the USB.

## Updates in pieces

On Arch-based systems you can **download updates now and install later**:

```bash
sudo pacman -Syuw     # download only
sudo pacman -Syu      # install what was downloaded
```

Running the same command again after a drop continues the download.

## Share downloads between PCs

Copy the package cache (`/var/cache/pacman/pkg/` on Arch-based, `/var/cache/apt/archives/` on Debian-based) to a USB stick and use it on another PC.

## Phone as a fallback

Plug your phone in with a USB cable and enable **USB tethering**. It works in live USB sessions without extra drivers on most distros.

## Mirrors

Some distros let you rank mirrors by speed (CachyOS has a mirror-rating tool; Arch has `reflector`). Choose a nearby country.

## Offline documentation

Save this repo (`git clone` or download the ZIP), and the Arch Wiki pages you use, to your drive before wiping Windows.
