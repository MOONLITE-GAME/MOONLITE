extends Node2D

func _ready() -> void:
	$Player/Camera2D.limit_bottom = 1080;
	$Player/Camera2D.limit_left = 0;

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ScrollUp"):
		$Player/Camera2D.zoom.x = $Player/Camera2D.zoom.x + 50 * delta;
		$Player/Camera2D.zoom.y = $Player/Camera2D.zoom.y + 50 * delta;
	if Input.is_action_just_pressed("ScrollDown"):
		$Player/Camera2D.zoom.x = $Player/Camera2D.zoom.x - 50 * delta;
		$Player/Camera2D.zoom.y = $Player/Camera2D.zoom.y - 50 * delta;
