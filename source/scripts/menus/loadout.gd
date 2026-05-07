extends Control

var curWeapon:int;
var maxWeapon:int = -1;
var dir = "data/weapons/";
var normDir = "res://assets/";
var arr;

func getWeapons():
	if DirAccess.dir_exists_absolute(normDir + dir):
		arr = DirAccess.get_files_at(normDir+dir);
		print(arr);
		print(arr[curWeapon]);

func _ready() -> void:
	curWeapon = 0;
	$weaponIcon/text.text = Stats.weapon;
	
	if DirAccess.dir_exists_absolute(normDir + dir):
		maxWeapon = -1;
		for i in DirAccess.get_files_at(normDir + dir):
			maxWeapon = maxWeapon + 1;
			print(str(maxWeapon));
			
	Camera.position = Vector2(960, 540);
	
	if Stats.mobile:
		$exit.visible = true;

func _process(_delta: float) -> void:
	$confirm.text = "Max Weapons: " + str(maxWeapon) + " Cur Weapon: " + str(curWeapon);
	
	$weaponIcon/text.text = Stats.weapon;
	
	if Input.is_action_just_pressed("uiLEFT"):
		$AudioStreamPlayer.play();
		curWeapon = curWeapon - 1;
		getWeapons();
		getWeaponData();
		if curWeapon == -1:
			curWeapon = maxWeapon;
			
	if Input.is_action_just_pressed("uiRIGHT"):
		$AudioStreamPlayer.play();
		if curWeapon == maxWeapon:
			curWeapon = 0;
		else:
			curWeapon = curWeapon + 1;
		getWeapons();
		getWeaponData();
		
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
			
	match Stats.weaponType:
		"Sword":
			$weaponIcon/sprite.texture_normal = load("res://assets/shared/images/hud/weaponIcons/sword.png");
		"Hammer":
			$weaponIcon/sprite.texture_normal = load("res://assets/shared/images/hud/weaponIcons/hammer.png");
		"Ground Pound":
			$weaponIcon/sprite.texture_normal = load("res://assets/shared/images/hud/weaponIcons/groundPound.png");
		
func getWeaponData():
	SaveIcon.showIcon();
	var path = normDir+dir+arr[curWeapon];
	
	if FileAccess.file_exists(path):
		print(path);
		print("Yep. it exists");
		var file = FileAccess.open(path, FileAccess.READ);
		var jsonString = file.get_as_text();
		var json = JSON.new();
		var parseResult = json.parse(jsonString);
		
		if not parseResult == OK:
			print("Shit, it doesn't work. God damn it.");
			return;
			
		var data = json.get_data();
			
		if "weaponName" in data:
			Stats.weapon = data.weaponName;
		if "weaponType" in data:
			Stats.weaponType = data.weaponType;
		
func _on_arrow_left_pressed() -> void:
	$AudioStreamPlayer.play();
	curWeapon = curWeapon - 1;
	if curWeapon == -1:
		curWeapon = maxWeapon;

func _on_arrow_right_pressed() -> void:
	$AudioStreamPlayer.play();
	curWeapon = curWeapon + 1;
	if curWeapon >= maxWeapon:
		curWeapon = 0;

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/characterSelect.tscn");

func _on_sprite_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/levels/bridge/tutorial.tscn");
