extends Control

var curWeapon:int = 1;
var maxWeapon:int = 3;

func _ready() -> void:
	curWeapon = 1;
	$weaponIcon/text.text = Stats.weapon;

func _process(_delta: float) -> void:
	$weaponIcon/text.text = Stats.weapon;
	if Input.is_action_just_pressed("uiLEFT"):
		curWeapon = curWeapon - 1;
		if curWeapon == 0:
			curWeapon = maxWeapon;
	if Input.is_action_just_pressed("uiRIGHT"):
		curWeapon = curWeapon + 1;
		if curWeapon > maxWeapon:
			curWeapon = 1;
	if Input.is_action_pressed("uiLEFT"):
		$Arrow.modulate = Color("00ffff");
	else:
		$Arrow.modulate = Color("ffffff");
	if Input.is_action_just_pressed("uiRIGHT"):
		$Arrow2.modulate = Color("00ffff");
	else:
		$Arrow2.modulate = Color("ffffff");
		
	if Input.is_action_just_pressed("uiSELECT"):
		get_tree().change_scene_to_file("res://source/scenes/levels/bridge/tutorial.tscn");
		
	match curWeapon:
		1:
			Stats.weapon = "Dark Sword";
		2:
			Stats.weapon = "Hammer of Zoomin'";
		3:
			Stats.weapon = "Ground Pound";
