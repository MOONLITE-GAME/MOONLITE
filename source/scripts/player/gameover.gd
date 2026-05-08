extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("uiSELECT"):
		Stats.playerX = 0;
		Stats.playerY = 0;
		Stats.health = Stats.maxHealth;
		get_tree().change_scene_to_file("res://source/scenes/levels/bridge/tutorial.tscn");
