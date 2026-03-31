extends Control;

var curButton:int = 1;

func _process(_delta: float) -> void:
	checkPauseInput();

func checkPauseInput():
	if Input.is_action_just_pressed("Pause") && get_tree().paused == false:
		pause();
		
	elif Input.is_action_just_pressed("Pause") && get_tree().paused == true:
		$AudioStreamPlayer.stream = null;
		resume();

func pause():
	get_tree().paused = true;
	$".".visible = true;

func resume():
	get_tree().paused = false;
	$".".visible = false;
