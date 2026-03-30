extends AudioStreamPlayer

var dataPath:String;
var assetPath:String;

func loadSound(soundName):
	assetPath = "res://assets/sounds/" + soundName + ".ogg";

	stream = load(assetPath);
	print("Song Loaded!");
	play();

func stopMusic():
	stream = null;
	stop();
