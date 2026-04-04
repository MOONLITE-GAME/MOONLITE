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
var arrayData;
var mus;

func _ready() -> void:
	curAlbum = 1;
	curSong = 0;
	MusicEngine.stopMusic();
	getAlbumData();

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("uiUP"):
		curSong = curSong - 1;
		if curSong < 0:
			curSong = songNum;
		updateSong();
	if Input.is_action_just_pressed("uiDOWN"):
		curSong = curSong + 1;
		if curSong > songNum:
			curSong = 0;
		updateSong();
	if Input.is_action_just_pressed("uiEXIT"):
		MusicEngine.stopMusic();
		MusicEngine.loadSong("titleScreen");
		get_tree().change_scene_to_file("res://source/scenes/menus/extras.tscn");

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
			songNum = data.songs - 1; # godot starts arrays at 0, so this subtracts 1 from the total amount of songs to account for it
			
		$AlbumText.text = albumName;
		
		getSongData();

func getSongData():
	songPath = "res://assets/data/songs/albums/songList-" + album + ".txt";
	
	arrayData = FileAccess.get_file_as_string(songPath);
	print(str(arrayData.split(", ")));
	
	updateSong();
	
func updateSong():
	MusicEngine.stopMusic();
	mus = arrayData.split(", ")[curSong];
	print(mus);
	MusicEngine.loadSong(mus);
	$OSTText.text = MusicEngine.title + " - " + MusicEngine.artist;
	$ostBar/ostText.text = "Track #" + str(curSong + 1);
