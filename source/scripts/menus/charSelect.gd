extends Control

func _ready() -> void:
	MusicEngine.stopMusic();
	updateChar();
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("uiSELECT"):
		get_tree().change_scene_to_file("res://source/scenes/menus/loadout.tscn");

func updateChar():
	$ui/characterName.text = Stats.character;
