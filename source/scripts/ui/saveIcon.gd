extends CanvasLayer;

func _ready() -> void:
	visible = false;

func showIcon():
	$AnimationPlayer.play("RESET");
	visible = true;
	$icon.play("loading blob");
	await get_tree().create_timer(1.0).timeout;
	$AnimationPlayer.play("fadeOut");
	$icon.stop();
