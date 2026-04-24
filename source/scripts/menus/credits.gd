extends Control

var scrollSpeed:float = 75.0;

func _ready() -> void:
	MusicEngine.stopMusic();
	MusicEngine.loadSong("bopeeboMoonlite");
	
	if Stats.mobile:
		$exit.visible = true;

func _process(delta: float) -> void:
	$credits.position.y -= delta * scrollSpeed;
	
	#if $credits.position.y <= -2309:
	if Input.is_action_just_pressed("uiEXIT"):
		MusicEngine.stopMusic();
		MusicEngine.loadSong("titleScreen");
		get_tree().change_scene_to_file("res://source/scenes/menus/extras.tscn");


func _on_exit_pressed() -> void:
	MusicEngine.stopMusic();
	MusicEngine.loadSong("titleScreen");
	get_tree().change_scene_to_file("res://source/scenes/menus/extras.tscn");
