extends Node2D

func _ready() -> void:
	bounce();

func bounce():
	$lock.scale = Vector2(1.1, 1.1);
	await get_tree().create_timer(0.1).timeout;
	$lock.scale = Vector2(1, 1);
