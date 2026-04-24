extends Node

# vars for backend stuff
var savePath:String;
var charPath:String = "res://assets/data/characters/";
var assetPath:String;
var character:String;
var fullscreen:bool;

# vars for character stats
var health:int;
var maxHealth:int;
var weapon:String;
var weaponType:String;
var item:String;
var itemType:String;

# animation data
var idleLeft:String;
var idleRight:String;
var runLeft:String;
var runRight:String;
var attackLeft:String;
var attackRight:String;
var dodgeLeft:String;
var dodgeRight:String;
var attackRunLeft:String;
var attackRunRight:String;
var slideLeft:String;
var slideRight:String;

# vars for general data
var playerX:float;
var playerY:float;
var element:String;
var charName:String;
var debug:bool = true;
var attacking:bool = false;
var volume:float;
var musicVolume:float;
var sfxVolume:float;
var inDialogue:bool = false;
var moving:bool;
var canClimb:bool = false;

func saveStats():
	SaveIcon.showIcon();
	var file = FileAccess.open(savePath, FileAccess.WRITE);

	var data = {};

	data.health = health;
	data.maxHealth = maxHealth;
	data.weapon = weapon;
	data.item = item;
	volume = AudioServer.get_bus_volume_db(Volume.index);
	data.volume = volume;
	data.musicVolume = musicVolume;
	data.sfxVolume = sfxVolume;
	data.fullscreen = fullscreen;
	data.freecam = Camera.freeCam;

	var json_string = JSON.stringify(data);
	file.store_string(json_string);

func loadStats():
	SaveIcon.showIcon();
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
		
		if "volume" in data:
			volume = data.volume;
		else:
			volume = -5.0;
			saveStats();
			
		if "musicVolume" in data:
			musicVolume = data.musicVolume;
		else:
			musicVolume = 0.0;
			saveStats();
			
		if "sfxVolume" in data:
			sfxVolume = data.sfxVolume;
		else:
			sfxVolume = 0.0;
			saveStats();
			
		if "fullscreen" in data:
			fullscreen = data.fullscreen;
		else:
			fullscreen = false;
			saveStats();
			
		if "freecam" in data:
			Camera.freeCam = data.freecam;
		else:
			Camera.freeCam = false;
			saveStats();

	else:
		print("No save file. Creating a new one.");
		health = 100;
		maxHealth = 100;
		weapon = "Dark Sword";
		fullscreen = false;
		saveStats();
		
	if fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN);
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);
		
func loadCharJSON():
	SaveIcon.showIcon();
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
			
		if "idleLeft" in data:
			idleLeft = data.idleLeft;
		if "idleRight" in data:
			idleRight = data.idleRight;
		if "runLeft" in data:
			runLeft = data.runLeft;
		if "runRight" in data:
			runRight = data.runRight;
		if "attackLeft" in data:
			attackLeft = data.attackLeft;
		if "attackRight" in data:
			attackRight = data.attackRight;
		if "dodgeLeft" in data:
			dodgeLeft = data.dodgeLeft;
		if "dodgeRight" in data:
			dodgeRight = data.dodgeRight;
		if "attackRunLeft" in data:
			attackRunLeft = data.attackRunLeft;
		if "attackRunRight" in data:
			attackRunRight = data.attackRunRight;
		if "slideLeft" in data:
			slideLeft = data.slideLeft;
		if "slideRight" in data:
			slideRight = data.slideRight; 

	else:
		print("File does not exist.");
