extends Node

var index = AudioServer.get_bus_index("Master");
var musIndex = AudioServer.get_bus_index("Music");
var sfxIndex = AudioServer.get_bus_index("SFX");
var muted:bool = false;

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("VolUp"):
		AudioServer.set_bus_volume_db(index, AudioServer.get_bus_volume_db(index) + 1.0);
		AudioEngine.loadSound("beep");
		Stats.saveStats();
	if Input.is_action_just_pressed("VolDown"):
		AudioServer.set_bus_volume_db(index, AudioServer.get_bus_volume_db(index) - 1.0);
		AudioEngine.loadSound("beep");
		Stats.saveStats();
	if Input.is_action_just_pressed("Mute"):
		match muted:
			true:
				muted = false;
			false:
				muted = true;
		AudioServer.set_bus_mute(index, muted);
