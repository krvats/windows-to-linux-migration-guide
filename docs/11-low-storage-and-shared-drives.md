---
title: "Dual Boot Linux With Limited Storage: Safe Partition Guide"
description: "Dual boot Linux with limited storage and no data loss. Shrink partitions safely, use shared drives, and avoid common Disk Management mistakes."
---
# 11. Low storage, shared drives and partition tricks

*Last reviewed: 2026-10-27*

## Golden rule for other people's drives

> **Never format, delete, shrink or move a drive or partition that belongs to someone else without their permission.** Ask first. Copy their data somewhere safe first. Verify. Then act.

## Read the disk map first

Open **Disk Management** (`diskmgmt.msc`). Each physical disk is a row (Disk 0, Disk 1...). Boxes on a row are partitions.

- A drive with a **"Boot"** partition and `Windows`, `Users`, `Program Files` folders holds **someone's Windows**. If you delete or shrink the wrong one, that PC will not boot.
- Small partitions without letters (EFI, Recovery) belong to that Windows. Leave them.
- Your own system drive may show as `C:` while another Windows on a plugged-in drive appears as `D:`. That is normal.

## Make space without breaking anything

| Method | Risk | Notes |
|---|---|---|
| **Use a folder** on free space in another drive | Lowest | Delete the folder later, space returns instantly |
| **Shrink a volume** in Disk Management | Low | Creates unallocated space **after** the shrunk volume only |
| **Delete an empty volume** after copying its files | Low | Only after the copy is verified and the owner agrees |
| **Move a partition** (MiniTool, AOMEI) | Medium | A power cut mid-move can corrupt it; copy its data first |

### Why two unallocated blocks do not merge

Windows merges free space only when the blocks **touch**. A volume sitting between them blocks the merge. Fix by either deleting that volume (after copying its data) or moving it with a partition tool.

### Units

Disk Management asks for MB. 1 GB is 1024 MB there. So 250 GB is `256000` MB.

## Space planning

1. Check **used** space on the drive you are switching, not the total size.
2. Your real data is smaller than used space, because Windows and programs (often 100 GB or more) will be replaced.
3. If a full disk image does not fit, skip it and rely on plain copies of your data.

## When you only have one drive

- A **verified backup on another drive** is the price of going Linux-only. Borrow or buy a cheap external drive.
- Or **dual boot** and keep Windows until you are sure.
- Or leave huge re-downloadable games out of the backup.

## Delete your temporary space later

After 4 weeks on Linux, delete your backup folders or partition and, if you shrank something, extend it back.
