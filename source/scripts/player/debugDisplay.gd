extends Control;

func _ready() -> void:
	$EasterEggTime.text = ""; # i still haven't reimplemented the screensaver easter egg, so this text goes unused lol

func _process(_delta: float) -> void:
	if $".".visible:
		$FPS.text = "FPS: " + str(Engine.get_frames_per_second());
		$Coordinates.text = "X:" + str(Stats.playerX) + ", Y:" + str(Stats.playerY);
