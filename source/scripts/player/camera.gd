extends Camera2D

var camSpeed:float = 800.0;
var freeCam:bool = false;

func _process(delta: float) -> void:
	if freeCam:
		# Zoom Controls
		if Input.is_action_just_pressed("ScrollUp"):
			zoom.x = zoom.x + 50 * delta;
			zoom.y = zoom.y + 50 * delta;
		if Input.is_action_just_pressed("ScrollDown"):
			zoom.x = zoom.x - 50 * delta;
			zoom.y = zoom.y - 50 * delta;
		
		# Camera Pos Controls
		if Input.is_action_pressed("CameraLeft"):
			position.x = position.x - camSpeed * delta;
		if Input.is_action_pressed("CameraRight"):
			position.x = position.x + camSpeed * delta;
		if Input.is_action_pressed("CameraUp"):
			position.y = position.y - camSpeed * delta;
		if Input.is_action_pressed("CameraDown"):
			position.y = position.y + camSpeed * delta;
