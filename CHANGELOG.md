# Changelog
All notable changes will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.5] - 2026-??-??
THE FIFTH ALPHA RELEASE: UI CLEAN UP

### Added
- New Intro Sequence

### Changed
- Main Menu, Extras Menu, and Pause Menu Received Revamps!
- Options Menu Received Some Adjustments

## [0.0.4] - 2026-04-19
THE FORTH ALPHA RELEASE: PLATFORMING

### Added
- New room with platforming stuff!
- New Warp object!
- New Slide Mechanic!
	- This brings two new animations for playable characters: `slideLeft` and `slideRight`
- New Options Menu Revamp!
- New Cursor Sprite!
- New Controller Support (Doesn't fully work on all menus. This will be fixed next update!)

### Changed
- debugDisplay is now a global scene

## [0.0.3] - 2026-04-11
THE THIRD ALPHA RELEASE: LINUX BUILD, WEAPON ADJUSTMENTS, AND INTERACTABLE PROPS

### Added
- New Attack Walking Animations for Playable Characters!
- New Interactable Props in Tutorial
- Debug Display (Press ~ or F3 to access it in game!)
- New crate that reloads the current scene!
- New crate that brings you to the loadout select screen!
- New Dialogue System in Game! 
	- This system utilizes the [Dialogic Plugin!](https://github.com/dialogic-godot/dialogic)
- The Ability to Mute the Game! (Keybind is 0)
- New `Stats.inDialogue` variable!
	- Freezes the player's movement and actions until set to false! Perfect for cutscenes (and of course, dialogue!)

### Changed
- Hammer of Zoomin' has been renamed to "Rebounder"
- Rebounder received stat changes
- Ground Pound received stat changes

## [0.0.2] - 2026-04-06
THE SECOND ALPHA RELEASE: NEW ENGINE REWRITE, ART, MUSIC, ETC.

### Added
- New Sprites for Moonlite!
- Mod Support for Windows!
- New Weapon Info on the HUD!
- New Loadout Menu for Weapons!
- New WIP Options Menu
- New Soundtrack Menu (Only on Windows)
- New (but currently unused) `itemType` property to baseItem.gd!
- New `weaponType` property to baseWeapon.gd!
- Music to the saveFile Screen!
- New MusicEngine and AudioEngine for all of your music/sound needs!
- New Music in the Tutorial!
- The ability to beat the shit out of Dummy
- The ability to change the volume of the game! (Press - or +)

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
