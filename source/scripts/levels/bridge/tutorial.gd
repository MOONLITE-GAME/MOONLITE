extends Node2D

func _ready() -> void:
	print("Playing as character: " + Stats.character);
	MusicEngine.stopMusic();
	MusicEngine.loadSong("tutorial");
	Camera.limit_left = -1150;
	Camera.limit_bottom = 1080;
	
func _process(_delta: float) -> void:
	if not Camera.freeCam:
		Camera.position.x = Stats.playerX;
		Camera.position.y = Stats.playerY;
