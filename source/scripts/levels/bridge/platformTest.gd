extends Node2D

var rng = RandomNumberGenerator.new();
var musRNG:int;

func _ready() -> void:
	Camera.limit_bottom = 1080;
	Camera.limit_left = 0;
	MusicEngine.stopMusic();
	getNewMusic();

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ScrollUp"):
		Camera.zoom.x = Camera.zoom.x + 50 * delta;
		Camera.zoom.y = Camera.zoom.y + 50 * delta;
	if Input.is_action_just_pressed("ScrollDown"):
		Camera.zoom.x = Camera.zoom.x - 50 * delta;
		Camera.zoom.y = Camera.zoom.y - 50 * delta;
	
	if not Camera.freeCam:
		Camera.position.x = Stats.playerX;
		Camera.position.y = Stats.playerY;

func getNewMusic():
	musRNG = rng.randi_range(1, 4);
	
	match musRNG:
		1:
			$MUSIC.stream = load("res://assets/music/bopeeboMoonlite.ogg");
		2:
			$MUSIC.stream = load("res://assets/music/saveFiles.ogg");
		3:
			$MUSIC.stream = load("res://assets/music/titleScreen.ogg");
		4:
			$MUSIC.stream = load("res://assets/music/tutorial.ogg");
	
	$MUSIC.play();

func _on_music_finished() -> void:
	getNewMusic();
