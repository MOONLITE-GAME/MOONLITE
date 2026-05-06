extends Control

func _ready() -> void:
	MusicEngine.loadSong("titleScreen");
	$versionNum.text = "v" + ProjectSettings.get_setting("application/config/version");
	Camera.limit_bottom = 10000000;
	Camera.limit_right = 10000000;
	Camera.limit_left = -10000000;
	Camera.limit_top = -10000000;
	Camera.zoom = Vector2(1,1);
	Camera.position = Vector2(960, 540);
	
	if Stats.mobile:
		$tap.visible = true;
		$pressAnything.visible = false;
	else:
		$pressAnything.visible = true;

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("uiSELECT") or Input.is_action_just_pressed("Tap"):
		get_tree().change_scene_to_file("res://source/scenes/menus/mainMenu.tscn");
