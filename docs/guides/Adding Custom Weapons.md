# ADDING CUSTOM WEAPONS

With the release of MOONLITE Alpha v0.0.6, a brand new `Weapon Creator` was added to the game!

This document will go over how to use it to add your very own weapons to the game!

## The Menu
To access the Weapon Creator menu, simply press the `~` on your keyboard while on the main menu!

Once you're in, there are many different things to fill out.

Once you've added your stats, press the `Save` button and name your file like this `NAME.json` (it has to be .json!)

Also make sure the file is saved in the `assets/data/weapons` directory or else it won't work!

## Custom Script
Once you've done that, in `source/scripts/items/weapons/` create a script named the exact same thing as your .json file (just without the .json at the end)

Inside your script, you should put `extends Weapon` at the very top.

After your script extends Weapon, put a function in there called `_ready()` and then put `pass` inside it.

Now when you enter the game, your weapon should be on the loadout screen!

As for making your weapon do stuff, you're on your own :P (that's why there's custom scripts!')
