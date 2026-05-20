extends Control

func _ready() -> void:
	# TODO: Make this read from json to avoid hardcoding!!!
	if Stats.character == "moonlite":
		$bg.color = Color("#A800FF");
