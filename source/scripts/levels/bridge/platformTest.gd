extends Node2D

func _ready() -> void:
	Camera.limit_bottom = 1080;
	Camera.limit_left = 0;

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ScrollUp"):
		Camera.zoom.x = Camera.zoom.x + 50 * delta;
		Camera.zoom.y = Camera.zoom.y + 50 * delta;
	if Input.is_action_just_pressed("ScrollDown"):
		Camera.zoom.x = Camera.zoom.x - 50 * delta;
		Camera.zoom.y = Camera.zoom.y - 50 * delta;
	
	if not Camera.freeCam:
		Camera.position.x = Stats.playerX;
		Camera.position.y = Stats.playerY;
