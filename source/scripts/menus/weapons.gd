extends Control

var curButton:int = 1;

func _ready() -> void:
	# TODO: Make this read from json to avoid hardcoding!!!
	Camera.position = Vector2(960, 540);
	
	if Stats.mobile:
		$exit.visible = true;
	else:
		$exit.visible = false;
	
	if Stats.weaponFile == "":
		Stats.weapon = "Dark Sword";
		Stats.weaponFile = "darkSword";
		getWeaponData();
		
	print("Current Weapon: " + Stats.weapon);
	print("Weapon File Name: " + Stats.weaponFile);
		
	$card.texture_normal = load("res://assets/images/menus/loadout/cards/" + Stats.weaponFile + ".png");
	
	if Stats.character == "moonlite":
		$bg.color = Color("#A800FF");
		$character.texture = load("res://assets/images/menus/loadout/characters/moonlite.png");
		$uiBack.texture = load("res://assets/images/menus/loadout/themes/back.png");
		$start.texture_normal = load("res://assets/images/menus/loadout/themes/start.png");

func _process(_delta: float) -> void:
	match curButton:
		1:
			$cardGlow.visible = true;
			$startGlow.visible = false;
		2:
			$cardGlow.visible = false;
			$startGlow.visible = true;
			
	if Input.is_action_just_pressed("uiDOWN") or Input.is_action_just_pressed("uiUP"):
		$AudioStreamPlayer.play();
		match curButton:
			1:
				curButton = 2;
			2:
				curButton = 1;
				
	if Input.is_action_just_pressed("uiSELECT"):
		match curButton:
			1:
				get_tree().change_scene_to_file("res://source/scenes/menus/weaponSelect.tscn");
			2:
				if Stats.hasSeenIntro:
					get_tree().change_scene_to_file("res://source/scenes/levels/bridge/tutorial.tscn");
				else:
					get_tree().change_scene_to_file("res://source/scenes/levels/bridge/tutorial/story/intro.tscn");
	
	if Input.is_action_just_pressed("uiEXIT"):
		get_tree().change_scene_to_file("res://source/scenes/menus/characterSelect/characterSelect.tscn");
		
func getWeaponData():
	SaveIcon.showIcon();
	var path = "res://assets/data/weapons/darkSword.json";
	
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
		if "attackCooldown" in data:
			Stats.weaponCooldown = data.attackCooldown;
		if "damage" in data:
			Stats.weaponDamage = data.damage;
		if "velocityTime" in data:
			Stats.velocityTime = data.velocityTime;
		if "weaponSound" in data:
			Stats.weaponSound = data.weaponSound;

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/characterSelect/characterSelect.tscn");

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/levels/bridge/tutorial.tscn");

func _on_card_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/weaponSelect.tscn");
