extends Control

var stringRNG = RandomNumberGenerator.new();
var rndmString:int;
var curButton:int = 1;
var textSpeed:float = 350.0;

func _ready() -> void:
	rndmString = stringRNG.randi_range(1, 12);
	Camera.limit_bottom = 10000000;
	Camera.limit_right = 10000000;
	Camera.limit_left = -10000000;
	Camera.limit_top = -10000000;
	Camera.zoom = Vector2(1,1);
	Camera.position = Vector2(960, 540);
	$selector.position.x = $play.position.x;

func _process(delta: float) -> void:
	$text.position.x -= textSpeed * delta;
	
	if $text.position.x < -10000:
		$text.position.x = 967;
		rndmString = stringRNG.randi_range(1, 12);

	match rndmString:
		1:
			$text.text = "VERSION ALPHA 0.0.5 - MENU REVAMPS";
		2:
			$text.text = "BROUGHT TO YOU BY RED ECLIPSE STUDIO";
		3:
			$text.text = "THE FATE OF THE UNIVERSE DEPENDS ON YOU. WHAT ARE YOU WAITING FOR?";
		4: 
			$text.text = "SHOUTOUT TO MY MOM. I LOVE YOU MOM";
		5:
			$text.text = "PLEASE DON'T BLAM US. WE'RE TRYING OUR BEST";
		6:
			$text.text = "A GAME FOR SOCIOPATHS, LOSERS, AND ALL SORTS OF OTHER FREAKS";
		7:
			$text.text = "MAN, I COULD GO FOR SOME CHICKEN RIGHT NOW";
		8:
			$text.text = "THIS ONE'S FOR YOU, HARAMBE";
		9:
			$text.text = "WARNING: THIS PRODUCT CONTAINS BLACK PEOPLE (literally)";
		10:
			$text.text = "IN LOVING MEMORY OF CHARLIE KIRK";
		11:
			$text.text = "THE ANSWER IS DIVINE INTELLECT";
		12:
			$text.text = "NOT FUNDED BY THE IDF";
			
	if Input.is_action_just_pressed("uiRIGHT"):
		$AudioStreamPlayer.play();
		match curButton:
			1:
				$selector.position.x = $options.position.x;
				curButton = 2;
			2:
				$selector.position.x = $extras.position.x;
				curButton = 3;
			3:
				$selector.position.x = $play.position.x;
				curButton = 1;
	if Input.is_action_just_pressed("uiLEFT"):
		$AudioStreamPlayer.play();
		match curButton:
			1:
				$selector.position.x = $extras.position.x;
				curButton = 3;
			2:
				$selector.position.x = $play.position.x;
				curButton = 1;
			3:
				$selector.position.x = $options.position.x;
				curButton = 2;
	if Input.is_action_just_pressed("uiSELECT"):
		match curButton:
			1:
				get_tree().change_scene_to_file("res://source/scenes/menus/characterSelect.tscn");
				Stats.playerX = 0;
				Stats.playerY = 0;
			2:
				get_tree().change_scene_to_file("res://source/scenes/menus/options.tscn");
			3:
				get_tree().change_scene_to_file("res://source/scenes/menus/extras.tscn");
