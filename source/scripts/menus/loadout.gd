extends Control

var curWeapon:int = 1;
var maxWeapon:int = 3;

func _ready() -> void:
	curWeapon = 1;
	$weaponIcon/text.text = Stats.weapon;
	Camera.position = Vector2(960, 540);
	
	if Stats.mobile:
		$exit.visible = true;

func _process(_delta: float) -> void:
	$weaponIcon/text.text = Stats.weapon;
	if Input.is_action_just_pressed("uiLEFT"):
		$AudioStreamPlayer.play();
		curWeapon = curWeapon - 1;
		if curWeapon == 0:
			curWeapon = maxWeapon;
	if Input.is_action_just_pressed("uiRIGHT"):
		$AudioStreamPlayer.play();
		curWeapon = curWeapon + 1;
		if curWeapon > maxWeapon:
			curWeapon = 1;
	if Input.is_action_pressed("uiLEFT"):
		$Arrow.modulate = Color("00ffff");
	else:
		$Arrow.modulate = Color("ffffff");
		
	if Input.is_action_pressed("uiRIGHT"):
		$Arrow2.modulate = Color("00ffff");
	else:
		$Arrow2.modulate = Color("ffffff");
		
	if Input.is_action_just_pressed("uiSELECT"):
		get_tree().change_scene_to_file("res://source/scenes/levels/bridge/tutorial.tscn");
	
	if Input.is_action_just_pressed("uiEXIT"):
		get_tree().change_scene_to_file("res://source/scenes/menus/characterSelect.tscn");
		
	match curWeapon:
		1:
			Stats.weapon = "Dark Sword";
			Stats.weaponType = "Sword"; # TODO: make this read from a script rather than just setting the value here.
		2:
			Stats.weapon = "Rebounder";
			Stats.weaponType = "Hammer";
		3:
			Stats.weapon = "Ground Pound";
			Stats.weaponType = "Ground Pound";
			
	match Stats.weaponType:
		"Sword":
			$weaponIcon/sprite.texture = load("res://assets/shared/images/hud/weaponIcons/sword.png");
		"Hammer":
			$weaponIcon/sprite.texture = load("res://assets/shared/images/hud/weaponIcons/hammer.png");
		"Ground Pound":
			$weaponIcon/sprite.texture = load("res://assets/shared/images/hud/weaponIcons/groundPound.png");
		


func _on_arrow_left_pressed() -> void:
	$AudioStreamPlayer.play();
	curWeapon = curWeapon - 1;
	if curWeapon == 0:
		curWeapon = maxWeapon;

func _on_arrow_right_pressed() -> void:
	$AudioStreamPlayer.play();
	curWeapon = curWeapon + 1;
	if curWeapon > maxWeapon:
		curWeapon = 1;


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/characterSelect.tscn");
