extends Control

func _ready() -> void:
	# TODO: Make this read from json to avoid hardcoding!!!
	if Stats.character == "moonlite":
		$bg.color = Color("#A800FF");
		$character.texture = load("res://assets/images/menus/loadout/characters/moonlite.png");
		$uiBack.texture = load("res://assets/images/menus/loadout/themes/back.png");
		$start.texture = load("res://assets/images/menus/loadout/themes/start.png");
