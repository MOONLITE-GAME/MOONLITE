extends Control;

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/credits.tscn");

func _on_ost_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/ost.tscn");

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("uiEXIT"):
		get_tree().change_scene_to_file("res://source/scenes/menus/mainMenu.tscn");
