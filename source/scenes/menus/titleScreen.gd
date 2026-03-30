extends Control

func _ready() -> void:
	MusicEngine.loadSong("titleScreen");

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("uiSELECT"):
		get_tree().change_scene_to_file("res://source/scenes/menus/mainMenu.tscn");
