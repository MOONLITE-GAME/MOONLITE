extends Control;

var curButton:int = 1;
var selectColor:Color = Color(18.892, 18.892, 18.892);
var normColor:Color = Color("ffffff");

const breakSpeed:float = -50.0;
const relaxSpeed:float = 50.0;

func _ready() -> void:
	$ui/resumeButton.self_modulate = selectColor;
	$ui/menuButton.scale = Vector2(1.0, 1.0);
	
	$breakText.position.y = 547;
	$relaxText.position.y = -884;

func _process(delta: float) -> void:
	textSlide(delta);
	if not Stats.inDialogue:
		checkPauseInput();
	
	if get_tree().paused:
		if Input.is_action_just_pressed("uiUP"):
			$uiSounds.play();
			match curButton:
				1:
					$ui/menuButton.self_modulate = selectColor;
					$ui/resumeButton.self_modulate = normColor;
					curButton = 2;
				2:
					$ui/resumeButton.self_modulate = selectColor;
					$ui/menuButton.self_modulate = normColor;
					curButton = 1;
					
		if Input.is_action_just_pressed("uiDOWN"):
			$uiSounds.play();
			match curButton:
				1:
					$ui/menuButton.self_modulate = selectColor;
					$ui/resumeButton.self_modulate = normColor;
					curButton = 2;
				2:
					$ui/resumeButton.self_modulate = selectColor;
					$ui/menuButton.self_modulate = normColor;
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


func _on_resume_button_pressed() -> void:
	if get_tree().paused:
		resume();
		
func _on_menu_button_pressed() -> void:
	if get_tree().paused:
			resume();
			get_tree().change_scene_to_file("res://source/scenes/menus/titleScreen.tscn");
			
func textSlide(elapsed):
	$breakText.position.y += breakSpeed * elapsed;
	$relaxText.position.y += relaxSpeed * elapsed;

	if $breakText.position.y < -1364:
		print("Resetting Text");
		$breakText.position.y = 547;
		$relaxText.position.y = -884;
