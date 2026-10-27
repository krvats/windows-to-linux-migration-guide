# 09. Customization: Caelestia, Hyprland and themes

*Last reviewed: 2026-10-27*

> **Do this last.** Install themes only after games, saves and projects work.

## Terms

- **Desktop environment (DE):** the full desktop (KDE Plasma, GNOME).
- **Window manager (WM):** just the window handling (Hyprland). Tiling means windows snap into a grid.
- **Shell:** the bar, launcher, notifications and widgets built on a WM. **Caelestia** is one.
- **Dotfiles:** your config files. Keep them in Git.

## Safe way to try Caelestia

1. Install a normal desktop first (KDE Plasma). Keep it as your **fallback session**.
2. Open the Caelestia repository (github.com/caelestia-dots/caelestia) and follow its README **exactly**. Install steps change, so use the README, not a screenshot or old video.
3. Log out. At the login screen choose the **Hyprland** session.
4. If it breaks, log in with Plasma. Nothing is lost.

## Good habits

- Take a **snapshot** (btrfs Snapper or Timeshift) before big changes.
- Change one thing at a time.
- Keep a Git repo of your configs: `git init ~/.config` style repos, or use a tool like `chezmoi` or GNU Stow.
- Back up `~/.config` before experimenting.

## Other options

| Style | Examples |
|---|---|
| Polished full desktop | KDE Plasma, GNOME |
| Tiling, beginner friendly | Hyprland with pre-made dots, Sway, Niri |
| Light and fast | XFCE, LXQt |
| Shell on top of Hyprland | Caelestia, Illogical Impulse, Noctalia and similar projects |

Browse community setups on r/unixporn for ideas.
