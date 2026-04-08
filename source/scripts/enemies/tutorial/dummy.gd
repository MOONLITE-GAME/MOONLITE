extends Area2D;

# maybe in future make this the script for any static enemies

var inside:bool = false;
var dummyRNG:int;
var voiceRNG:int;
var rng = RandomNumberGenerator.new();

# animations
var idleLeft:String;
var hit:String;

func _ready() -> void:
	loadData("res://assets/data/characters/enemies/tutorial/dummy.json");
	$AnimatedSprite2D.play(idleLeft);

func _process(_delta: float) -> void:
	if inside:
		if Input.is_action_just_pressed("BasicAttack") and not Stats.attacking and not Stats.inDialogue:
			dummyRNG = rng.randi_range(1, 2);
			print("Dummy RNG: " + str(dummyRNG));
			if dummyRNG == 1:
				voiceRNG = rng.randi_range(1, 3);
				$AudioStreamPlayer2D.stream = load("res://assets/sounds/dummyEasterEgg/hit" + str(voiceRNG) + ".ogg");
				$AudioStreamPlayer2D.play();
			$AnimatedSprite2D.play(hit);
			AudioEngine.loadSound("dummyHit");
		if Input.is_action_just_pressed("Interact") and not Stats.attacking and not Stats.inDialogue:
			Stats.inDialogue = true;
			Dialogic.start("dummyDialogueTutorial");
			
	if Dialogic.VAR.isDone == true and Stats.inDialogue:
		Dialogic.VAR.isDone = false;
		Stats.inDialogue = false;
		
func loadData(path):
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ);
		var json_string = file.get_as_text();
		var json = JSON.new();
		var parse_result = json.parse(json_string);

		if not parse_result == OK:
			print("JSON parse error ", json.get_error_message(), " on line ", json.get_error_line());
			return;

		var data = json.get_data();
	
		if "idleLeft" in data:
			idleLeft = data.idleLeft;
		if "hit" in data:
			hit = data.hit;

	else:
		print("File does not exist.");


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		inside = true;

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		inside = false;


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == hit:
		$AnimatedSprite2D.play(idleLeft);
