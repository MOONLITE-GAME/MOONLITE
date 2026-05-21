extends Control

const scrollSpeed:float = 75.0;

func _ready() -> void:
	$Label.position.x = 1260;
	getSongData();

func getSongData():
	$Label.text = "NOW PLAYING: " + MusicEngine.title + " - " + MusicEngine.artist;
	
func _process(delta: float) -> void:
	$Label.position.x -= scrollSpeed * delta;
	
	if $Label.position.x < -2676:
		$Label.position.x = 1260;	
		getSongData();
