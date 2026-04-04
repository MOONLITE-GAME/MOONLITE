extends Control

var album:String;
var albumName:String;
var artist:String;
var songName:String;
var songPath:String;
var albumPath:String;
var songNum:int;
var curSong:int;
var curAlbum:int;
var maxAlbum:int = 1;

func _ready() -> void:
	curAlbum = 1;
	getAlbumData()

func getAlbumData():
	# album registry
	match curAlbum:
		1:
			album = "vol1";
			
	albumPath = "res://assets/data/songs/albums/" + album + ".json";
	
	if FileAccess.file_exists(albumPath):
		var file = FileAccess.open(albumPath, FileAccess.READ);
		var json_string = file.get_as_text();
		var json = JSON.new();
		var parse_result = json.parse(json_string);

		if not parse_result == OK:
			print("Parse Error -- ", json.get_error_message());

		var data = json.get_data();

		if "name" in data:
			albumName = data.name;
		if "songs" in data:
			songNum = data.songs;\
			
		$AlbumText.text = albumName;

func getSongData():
	songPath = "res://assets/data/songs/albums/songList-" + album + ".txt";
