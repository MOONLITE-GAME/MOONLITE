extends Control

var curButton:int = 1;

func _ready() -> void:
	# TODO: Make this read from json to avoid hardcoding!!!
	if Stats.character == "moonlite":
		$bg.color = Color("#A800FF");
		$character.texture = load("res://assets/images/menus/loadout/characters/moonlite.png");
		$uiBack.texture = load("res://assets/images/menus/loadout/themes/back.png");
		$start.texture = load("res://assets/images/menus/loadout/themes/start.png");

func _process(delta: float) -> void:
	match curButton:
		1:
			$cardGlow.visible = true;
			$startGlow.visible = false;
		2:
			$cardGlow.visible = false;
			$startGlow.visible = true;
			
	if Input.is_action_just_pressed("uiDOWN") or Input.is_action_just_pressed("uiUP"):
		match curButton:
			1:
				curButton = 2;
			2:
				curButton = 1;
