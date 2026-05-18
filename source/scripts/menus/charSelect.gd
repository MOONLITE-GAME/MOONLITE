extends Control

# TODO: Maybe don't hardcode this? We could have it read from data/characters, idk. Maybe we keep the array and just add characters from the data folder that aren't already in there.
var characters:Array = ["moonlite", "locked", "locked", "locked", "locked", "locked", "locked", "locked"];
var curChar:int = 0;
var maxChar:int;
var instance;
var charNode;

func _ready() -> void:
	MusicEngine.stopMusic();
	updateChar();
	updateMaxChar();
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("uiSELECT"):
		if Stats.character != "locked":
			get_tree().change_scene_to_file("res://source/scenes/menus/loadout.tscn");
	if Input.is_action_just_pressed("uiEXIT"):
		get_tree().change_scene_to_file("res://source/scenes/menus/mainMenu.tscn");
		MusicEngine.loadSong("titleScreen");
		
	if Input.is_action_just_pressed("uiLEFT"):
		deleteChar();
		curChar = curChar - 1;
		updateChar();
		if curChar == -1:
			curChar = maxChar;	
	
	if Input.is_action_just_pressed("uiRIGHT"):
		deleteChar();
		if curChar == maxChar:
			curChar = 0;
		else:
			curChar = curChar + 1;
		updateChar();

func updateChar():
	charNode = load("res://source/scenes/menus/characterSelect/characters/" + characters[curChar] + ".tscn");
	Stats.character = characters[curChar];
	instance = charNode.instantiate();
	#instance.position = Vector2(984, 560);
	add_child(instance);
	$ui/characterName.text = Stats.character;
	print(curChar);

func updateMaxChar():
	for i in characters:
		maxChar = maxChar + 1;
		print(str(maxChar));
		
	maxChar = maxChar - 1;
		
func deleteChar():
	instance.queue_free();
