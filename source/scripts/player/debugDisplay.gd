extends CanvasLayer;

func _process(_delta: float) -> void:
	if $".".visible:
		$FPS.text = "FPS: " + str(Engine.get_frames_per_second());
		$Coordinates.text = "X:" + str(roundf(Stats.playerX)) + ", Y:" + str(roundf(Stats.playerY));
		$InDialogue.text = "Dialogue: " + str(Stats.inDialogue);

	if Input.is_action_just_pressed("DebugDisplay"):
		$AudioStreamPlayer.play();
		if visible:
			visible = false;
		else:
			visible = true;
