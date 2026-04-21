extends Control

var waitTime:float = 2.0;
var canContinue:bool = false;
var watchingMovie:bool = false;

func _ready() -> void:
	$AnyButton.visible = false;
	await get_tree().create_timer(waitTime).timeout;
	canContinue = true;
	$AnyButton.visible = true;

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("uiSELECT") and canContinue:
		$VideoStreamPlayer.play();
		watchingMovie = true;
	if event.is_action_pressed("SkipCutscene") and watchingMovie:
		_on_video_stream_player_finished();
	
func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/titleScreen.tscn");
