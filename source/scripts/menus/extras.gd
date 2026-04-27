extends Control;

var canVisitOST:bool = true;
var curButton:int = 1;

func _ready() -> void:
	if OS.get_name() == "Web" or Stats.mobile:
		canVisitOST = false;
	if Stats.mobile:
		$exit.visible = true;
		
	$selector.position.y = $credits.position.y;

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
				$selector.position.y = $ost.position.y;
				$image.texture = load("res://assets/images/menus/extras/moonliteOST.png");
				$image.position = Vector2(517.0, 191.0);
				curButton = 2;
			2:
				$selector.position.y = $credits.position.y;
				$image.texture = load("res://assets/images/menus/extras/credits.png");
				$image.position = Vector2(517.0, 327.0);
				curButton = 1;
	if Input.is_action_just_pressed("uiDOWN"):
		$AudioStreamPlayer.play();
		match curButton: 
			1:
				$selector.position.y = $ost.position.y;
				$image.texture = load("res://assets/images/menus/extras/moonliteOST.png");
				$image.position = Vector2(517.0, 191.0);
				curButton = 2;
			2:
				$selector.position.y = $credits.position.y;
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


func _on_credits_button_pressed() -> void:
	_on_credits_pressed();

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/mainMenu.tscn");
