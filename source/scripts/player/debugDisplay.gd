extends Control;

func _process(_delta: float) -> void:
	if $".".visible:
		$FPS.text = "FPS: " + str(Engine.get_frames_per_second());
