# AUDIO ENGINE
This document will go over how the audio and music engines work

## Why Use The Audio/Music Engine Rather Than an AudioStreamPlayer?
Using an AudioStreamPlayer is completely fine. The Audio/Music Engines are for when you want a sound/song to play across different scenes.

## How Do You Use The Audio Engine?
When you want to play a sound in your script, use `AudioEngine.loadSound()` and put the name of your song in the parentheses. For this to work, it has to be the exact file name in the `sounds` folder.
If you have a sound in a folder under the `sounds` folder, you can just put the path in there. For example, if you have a sound in `assets/sounds/dopeAssSound/sound.ogg` you can just to `AudioEngine.loadSound(dopeAssSound/sound)`

## How Do You Use The Music Engine?
The Music Engine is very similar to the Audio Engine. Instead of putting the path to your audio file, put the path to the songs `json` file in the data folder (For example: if your song's json file is at `assets/data/songs/titleScreen.json`, you would put `MusicEngine.loadSong(titleScreen)`).
Inside your `json` file, you should put the path to the audio file.
You can use `titleScreen.json` as an example:
	`{
	"Title": "MOONLITE (Main Theme)",
	"Artist": "E-DubzNG",
	"Album": "MOONLITE OST Vol. 1",
	"BPM": 120,
	"Path": "res://assets/music/titleScreen.ogg"
	}` 
The engine will read the path and load the song that way!

## How Do You Stop The Sound/Song?
Just use AudioEngine.stopSound() or MusicEngine.stopMusic()
