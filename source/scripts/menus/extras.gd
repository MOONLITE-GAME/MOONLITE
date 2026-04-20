extends Control;

var canVisitOST:bool = true;
var curButton:int = 1;

func _ready() -> void:
	if OS.get_name() == "Web":
		canVisitOST = false;
	$credits.texture = load("res://assets/images/menus/extras/creditsSelect.png");

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/credits.tscn");

func _on_ost_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/ost.tscn");

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("uiEXIT"):
		get_tree().change_scene_to_file("res://source/scenes/menus/mainMenu.tscn");
		
	if Input.is_action_just_pressed("uiUP"):
		$AudioStreamPlayer.play();
		match curButton: 
			1:
				$credits.texture = load("res://assets/images/menus/extras/creditsNormal.png");
				$ost.texture = load("res://assets/images/menus/extras/ostSelect.png");
				$image.texture = load("res://assets/images/menus/extras/moonliteOST.png");
				$image.position = Vector2(517.0, 191.0);
				curButton = 2;
			2:
				$credits.texture = load("res://assets/images/menus/extras/creditsSelect.png");
				$ost.texture = load("res://assets/images/menus/extras/ostNormal.png");
				$image.texture = load("res://assets/images/menus/extras/credits.png");
				$image.position = Vector2(517.0, 327.0);
				curButton = 1;
	if Input.is_action_just_pressed("uiDOWN"):
		$AudioStreamPlayer.play();
		match curButton: 
			1:
				$credits.texture = load("res://assets/images/menus/extras/creditsNormal.png");
				$ost.texture = load("res://assets/images/menus/extras/ostSelect.png");
				$image.texture = load("res://assets/images/menus/extras/moonliteOST.png");
				$image.position = Vector2(517.0, 191.0);
				curButton = 2;
			2:
				$credits.texture = load("res://assets/images/menus/extras/creditsSelect.png");
				$ost.texture = load("res://assets/images/menus/extras/ostNormal.png");
				$image.texture = load("res://assets/images/menus/extras/credits.png");
				$image.position = Vector2(517.0, 327.0);
				curButton = 1;
	if Input.is_action_just_pressed("uiSELECT"):
		match curButton:
			1:
				_on_credits_pressed();
			2:
				if canVisitOST:
					_on_ost_pressed();
				else:
					pass;
