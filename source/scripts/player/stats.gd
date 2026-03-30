extends Node

# vars for backend stuff
var savePath:String;
var charPath:String = "res://assets/data/characters/";
var assetPath:String;
var character:String;

# vars for character stats
var health:int;
var maxHealth:int;
var weapon:String;
var weaponType:String;
var item:String;
var itemType:String;

# vars for general data
var playerX:int;
var playerY:int;
var element:String;
var charName:String;
var debug:bool = true;
var attacking:bool = false;

func saveStats():
	var file = FileAccess.open(savePath, FileAccess.WRITE);

	var data = {};

	data.health = health;
	data.maxHealth = maxHealth;
	data.weapon = weapon;
	data.item = item;

	var json_string = JSON.stringify(data);
	file.store_string(json_string);

func loadStats():
	if FileAccess.file_exists(savePath):
		var file = FileAccess.open(savePath, FileAccess.READ);
		var json_string = file.get_as_text();
		var json = JSON.new();
		var parse_result = json.parse(json_string);

		if not parse_result == OK:
			print("JSON parse error -- ", json.get_error_message(), " on line ", json.get_error_line());
			return;
		
		var data = json.get_data();
		
		if "health" in data:
			health = data.health;
		else:
			health = 100;
			saveStats();
		
		if "maxHealth" in data:
			maxHealth = data.maxHealth;
		else:
			maxHealth = 100;
			saveStats();
		
		if "weapon" in data:
			weapon = data.weapon;
		else:
			weapon = "Dark Sword";
			saveStats();
		
		if "item" in data:
			item = data.item;
		else:
			item = "";
			saveStats();

	else:
		print("No save file. Creating a new one.");
		health = 100;
		maxHealth = 100;
		weapon = "Dark Sword";
		saveStats();
		
func loadCharJSON():
	var path = charPath + character + ".json";
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ);
		var json_string = file.get_as_text();
		var json = JSON.new();
		var parse_result = json.parse(json_string);

		if not parse_result == OK:
			print("JSON parse error ", json.get_error_message(), " on line ", json.get_error_line());
			return;

		var data = json.get_data();

		if "name" in data:
			charName = data.name;

		if "path" in data:
			assetPath = "res://" + data.path;
			print(assetPath);

		if "element" in data:
			element = data.element;

	else:
		print("File does not exist.");
