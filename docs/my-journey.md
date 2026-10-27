# My journey: switching from Windows to Linux

*Last reviewed: 2026-10-27*

This is a real record of one person's switch, with the constraints, the wrong turns and the decisions. Your situation will differ, but the problems repeat.

## My starting point

- One 1 TB NVMe drive with Windows, mostly full of games (many Souls-like games mid-progress).
- Very slow, unreliable internet, so re-downloading hundreds of GB was impossible.
- Tight budget. Drive prices had gone up.
- Work: video editing and game development.
- Goal: one operating system long term, a custom look (Caelestia) and **zero lost files or saves**.

## Timeline

1. **Wanted Linux for customization.** First worry: losing games and progress.
2. **Looked at dual boot.** It works, but it eats space and I wanted a single OS.
3. **Realized one drive plus no backup is impossible.** Something has to hold a copy of everything first.
4. **Found a spare hard drive** and realized its free space could hold a copy.
5. **Too many files to pick by hand** (AppData, game folders, other drives). Switched to bulk methods: copy the whole user profile with `robocopy`, copy each `steamapps` folder, and use Ludusavi for saves.
6. **Learned about disk images** (Rescuezilla). They are a great undo button, but pulling single files out is clumsy, so plain copies matter more.
7. **Checked prices.** No quick price drop. Buying a big drive was out.
8. **Understood the real drive map.** I had assumed 700 GB used. The real number was about 530 GB. Always read the real numbers.
9. **Needed room on a borrowed drive.** Learned the rules in [11](11-low-storage-and-shared-drives.md): never touch someone else's Windows partition, and unallocated blocks only merge when they touch.
10. **Chose the path:** plain copies to the free space, skip the giant image, then Linux-only with the backup kept for 4 weeks.

## Mistakes and lessons

| Mistake | Lesson |
|---|---|
| Assumed numbers instead of checking | Look at the actual used and free space first |
| Thought one big partition was needed | Two folders on two drives work just as well and are safer |
| Mixed up which drive was whose Windows | A second Windows shows as `D:`, not `C:`. Check for `Windows` and `Users` folders |
| Almost merged space the risky way | Copy first, verify, ask the owner, then act |
| Planned to do everything at once | Do it in phases and tick boxes |

## Result

*Fill this in after you finish:*
- Date I switched:
- Distro and desktop:
- What worked right away:
- What needed fixing:
- What I would do differently:
- Games that did not run:
- Time it really took:

## Advice to my past self

1. Check apps and games before anything else.
2. Try the live USB first.
3. Copy, verify, then erase. In that order.
4. Keep the backup for a month.
5. Ask for help with a screenshot, not a guess.
