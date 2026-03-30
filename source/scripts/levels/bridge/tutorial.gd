extends Node2D

func _ready() -> void:
	print("Playing as character: " + Stats.character);
	MusicEngine.stopMusic();
	$Player/Camera2D.limit_left = 0;
	$Player/Camera2D.limit_bottom = 1080;
