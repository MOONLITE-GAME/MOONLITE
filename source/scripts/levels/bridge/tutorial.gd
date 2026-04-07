extends Node2D

func _ready() -> void:
	print("Playing as character: " + Stats.character);
	MusicEngine.stopMusic();
	MusicEngine.loadSong("tutorial");
	$Player/Camera2D.limit_left = -1150;
	$Player/Camera2D.limit_bottom = 1080;
