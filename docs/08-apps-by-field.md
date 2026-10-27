# 08. Apps by field

*Last reviewed: 2026-10-27. Check each project's website for the current Linux build.*

## Gaming

| You use (Windows) | On Linux |
|---|---|
| Steam | Steam (native) + Proton |
| Epic, GOG | Heroic Games Launcher |
| Battle.net, EA, Ubisoft | Lutris or Bottles (results vary) |
| MSI Afterburner | MangoHud, GreenWithEnvy or LACT |
| Discord | Discord (native), Vesktop |

Tools: ProtonDB, GameMode, MangoHud, Gamescope.

## Video editing and streaming

| You use | On Linux |
|---|---|
| Premiere Pro | **DaVinci Resolve**, Kdenlive, Shotcut (no Premiere) |
| After Effects | Blender (compositing), Natron, Fusion in Resolve (no After Effects) |
| OBS | OBS (native) |
| HandBrake | HandBrake (native) |

**Resolve note:** the free Linux version has limits on some codecs (notably common phone/camera H.264/H.265 and AAC audio in the free edition). Convert footage with `ffmpeg` to an edit-friendly format, or use Kdenlive for those clips. Check Blackmagic's current system requirements.

## Design and photo

| You use | On Linux |
|---|---|
| Photoshop | Krita, GIMP, Photopea (browser) |
| Illustrator | Inkscape, Affinity (via Wine, unofficial) |
| Figma | Figma (browser) |
| Lightroom | darktable, RawTherapee |

## Game development

| You use | On Linux |
|---|---|
| Godot | Native |
| Unity | Unity Hub for Linux |
| Unreal Engine | Linux editor available (check Epic's requirements) |
| Blender | Native |
| Visual Studio | Use VS Code, JetBrains Rider |

## Programming

Everything is easier on Linux: Python, Node.js, Rust, Go, Docker, Git, VS Code, JetBrains IDEs, WSL is no longer needed.

## AI and data

Ollama, ComfyUI, Stable Diffusion tools, PyTorch and Jupyter run on Linux. NVIDIA users need the proprietary driver and CUDA. AMD users use ROCm. Models are the same files as on Windows.

## Students and office

| You use | On Linux |
|---|---|
| Microsoft Office | LibreOffice, OnlyOffice, or Office 365 in the browser |
| OneNote | Obsidian, Joplin, Notion |
| Anki, Zotero, Obsidian | Native |
| Zoom, Teams | Native or browser |

## Music production

Reaper, Bitwig, Ardour and Renoise are native. Many Windows plugins run through yabridge. Low-latency audio needs PipeWire setup.

## When there is no answer

Try Wine or Bottles, check the WineHQ AppDB, run Windows in a **virtual machine** (virt-manager, VirtualBox), or keep a small Windows dual boot.
