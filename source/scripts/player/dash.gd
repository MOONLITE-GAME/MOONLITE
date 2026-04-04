extends Node

var dodging:bool = false;
var duration = 0.2;

func _process(_delta: float) -> void:
	if dodging:
		await get_tree().create_timer(duration).timeout;
		dodging = false;
