# Changelog
All notable changes will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.2] - 2026-??-??
THE SECOND ALPHA RELEASE: NEW ENGINE REWRITE, ART, MUSIC, ETC.

### Added
- New Sprites for Moonlite!
- Mod Support for Windows!
- New Weapon Info on the HUD!
- New Loadout Menu for Weapons!
- New (but currently unused) `itemType` property to baseItem.gd!
- New `weaponType` property to baseWeapon.gd!
- Music to the saveFile Screen!
- New MusicEngine and AudioEngine for all of your music/sound needs!

### Fixed
- A bug where the main menu text only picks a number between 1-11 and 1-10 rather than the intended 1-12
- Made some adjustments to the tutorial area

### Changed
- Entire Engine Got Reworked, so 90% of files are changed and mods will probably break!
- Moved `affectsVelocity` property to baseItem.gd rather than baseWeapon.gd
- [DESKTOP] The game is now packaged with the source code instead of a .pck file. This means that mods can easily be made as the code in the source folder directly modifies the game!
- Company Name
- Position of Various HUD Elements!
- Crates can now be destroyed!
- Playable Character animations are now data driven!
- Font on Credits Menu!

### Removed
- A few crates from the tutorial area
- Kasane Teto
- In Game Item Menu
- Engie Playable Character (Temporary)

## [0.0.1] - 2026-03-24
The First Alpha Version!

### Added
- Literally everything, it's the first release!
