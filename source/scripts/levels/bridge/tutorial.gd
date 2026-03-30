extends Node2D

func _ready() -> void:
	print("Playing as character: " + Stats.character);
	MusicEngine.stopMusic();
