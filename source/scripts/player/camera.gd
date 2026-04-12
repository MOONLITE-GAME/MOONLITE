extends Camera2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ScrollUp"):
		zoom.x = zoom.x + 50 * delta;
		zoom.y = zoom.y + 50 * delta;
	if Input.is_action_just_pressed("ScrollDown"):
		zoom.x = zoom.x - 50 * delta;
		zoom.y = zoom.y - 50 * delta;
