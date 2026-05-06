extends AudioStreamPlayer

var dataPath:String;
var assetPath:String;
var title:String;
var artist:String;
var bpm:int;

func loadSong(songName):
	dataPath = "res://assets/data/songs/" + songName + ".json";

	if FileAccess.file_exists(dataPath):
		var file = FileAccess.open(dataPath, FileAccess.READ);
		var json_string = file.get_as_text();
		var json = JSON.new();
		var parse_result = json.parse(json_string);

		if not parse_result == OK:
			print("Parse Error -- ", json.get_error_message());

		var data = json.get_data();

		if "Path" in data:
			assetPath = data.Path;
		if "Title" in data:
			title = data.Title;
		if "Artist" in data:
			artist = data.Artist;
			

		stream = load(assetPath);
		print("Song Loaded!");
		play();

	else:
		print("Song does not exist!");

func stopMusic():
	stream = null;
	stop();


func _on_finished() -> void:
	play();
