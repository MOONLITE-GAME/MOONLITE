extends Control;

var curButton:int = 1;

func _ready() -> void:
	$ui/selector.position.y = $ui/resume.position.y;

func _process(_delta: float) -> void:
	if not Stats.inDialogue:
		checkPauseInput();
	
	if get_tree().paused:
		if Input.is_action_just_pressed("uiUP"):
			$uiSounds.play();
			match curButton:
				1:
					$ui/selector.position.y = $ui/map.position.y;
					curButton = 3;
				2:
					$ui/selector.position.y = $ui/resume.position.y;
					curButton = 1;
				3:
					$ui/selector.position.y = $ui/menu.position.y;
					curButton = 2;
					
		if Input.is_action_just_pressed("uiDOWN"):
			$uiSounds.play();
			match curButton:
				1:
					$ui/selector.position.y = $ui/menu.position.y;
					curButton = 2;
				2:
					$ui/selector.position.y = $ui/map.position.y;
					curButton = 3;
				3:
					$ui/selector.position.y = $ui/resume.position.y;
					curButton = 1;
		
		if Input.is_action_just_pressed("uiSELECT"):
			match curButton:
				1:
					if get_tree().paused:
						resume();
				2:
					if get_tree().paused:
						resume();
						get_tree().change_scene_to_file("res://source/scenes/menus/titleScreen.tscn");

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
