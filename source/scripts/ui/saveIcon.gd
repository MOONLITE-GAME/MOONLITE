extends CanvasLayer;

func _ready() -> void:
	visible = false;

func showIcon():
	visible = true;
	$icon.play("loading blob");
	await get_tree().create_timer(1.0).timeout;
	$icon.stop();
	visible = false;
