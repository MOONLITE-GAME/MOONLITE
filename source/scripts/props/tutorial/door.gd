extends Warp

func _process(_delta: float) -> void:
	if inside and not Stats.inDialogue and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene_to_file(targetRoom);
		Stats.playerX = targetX;
		Stats.playerY = targetY;
		
	if inside:
		$popup.visible = true;
	else:
		$popup.visible = false;
