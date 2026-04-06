extends Control

var curChar:int = 1;
var maxChar = 1;
var chr:String;

func _ready() -> void:
	chr = "moonlite";
	loadCharData(chr);

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("uiLEFT"):
		if curChar <= 0:
			curChar = maxChar;
		else:
			curChar = curChar - 1;
		loadCharData(chr);
	if Input.is_action_just_pressed("uiRIGHT"):
		if curChar > maxChar:
			curChar = curChar + 1;
		else:
			curChar = 1;
		loadCharData(chr);
	match curChar:
		1:
			chr = "moonlite";
			
	if Input.is_action_pressed("uiLEFT"):
		$Arrow.modulate = Color("00ffff");
	else:
		$Arrow.modulate = Color("ffffffff");
	if Input.is_action_pressed("uiRIGHT"):
		$Arrow2.modulate = Color("00ffff");
	else:
		$Arrow2.modulate = Color("ffffff");
		
	if Input.is_action_just_pressed("uiSELECT"):
		Stats.character = chr;
		get_tree().change_scene_to_file("res://source/scenes/menus/loadout.tscn");

# TODO: make json loading more efficient in a function or something so we don't have to repeat this shit 
func loadCharData(character:String):
	var dataPath:String = "res://assets/data/characters/" + character + ".json";

	if FileAccess.file_exists(dataPath):
		var file = FileAccess.open(dataPath, FileAccess.READ);
		var jsonString = file.get_as_text();
		var json = JSON.new();
		var parseResult = json.parse(jsonString);
		
		if not parseResult == OK:
			print("error");
		
		var data = json.get_data();
		
		if "name" in data:
			$charName.text = data.name;
