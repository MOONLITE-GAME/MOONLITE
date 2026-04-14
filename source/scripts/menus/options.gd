extends Control

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("uiEXIT"):
		get_tree().change_scene_to_file("res://source/scenes/menus/mainMenu.tscn");

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	Stats.fullscreen = toggled_on;
	Stats.saveStats();
	Stats.loadStats();

func _on_check_box_toggled(toggled_on: bool) -> void:
	Camera.freeCam = toggled_on;
	Stats.saveStats();
	Stats.loadStats();

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/mainMenu.tscn");
