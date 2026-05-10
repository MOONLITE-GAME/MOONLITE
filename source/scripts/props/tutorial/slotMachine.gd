extends StaticBody2D

var slot1Result:int;
var slot2Result:int;
var slot3Result:int;
var intoTheRadius:bool = false; # vr gaymers rise up
var rollTime:float = 5.0;
var rng = RandomNumberGenerator.new();
var rolling:bool = false;

func _ready() -> void:
	intoTheRadius = false;
	slot1Result = 0;
	slot2Result = 0;
	slot3Result = 0;
	
func rollDatShit():
	rolling = true;
	$slot1.play("slot moving");
	$slot2.play("slot moving");
	$slot3.play("slot moving");
	await get_tree().create_timer(rollTime).timeout;
	slot1Result = rng.randi_range(1, 4);
	slot2Result = rng.randi_range(1, 4);
	slot3Result = rng.randi_range(1, 4);
	print(str(slot1Result));
	print(str(slot2Result));
	print(str(slot3Result));
	
	match slot1Result:
		1:
			$slot1.play("loss");
		2:
			$slot1.play("nothing");
		3:
			$slot1.play("something");
		4:
			$slot1.play("seven");
	
	match slot2Result:
		1:
			$slot2.play("loss");
		2:
			$slot2.play("nothing");
		3:
			$slot2.play("something");
		4:
			$slot2.play("seven");
			
	match slot3Result:
		1:
			$slot3.play("loss");
		2:
			$slot3.play("nothing");
		3:
			$slot3.play("something");
		4:
			$slot3.play("seven");
			
	await get_tree().create_timer(1.0).timeout;
	results();
	rolling = false;
			
		
func results():
	if slot1Result == 1 and slot2Result == 1 and slot3Result == 1:
		Stats.health = -10000;
	
	if slot1Result == 2 and slot2Result == 2 and slot3Result == 2: 
		Stats.health = -10000;
		
	if slot1Result == 2:
		Stats.health = Stats.health - 10;
		
	if slot2Result == 2:
		Stats.health = Stats.health - 10;
		
	if slot3Result == 2:
		Stats.health = Stats.health - 10;
		
	if slot1Result == 3:
		Stats.health = Stats.health + 10;
		
	if slot2Result == 3:
		Stats.health = Stats.health + 10;
		
	if slot3Result == 3:
		Stats.health = Stats.health + 10;
	
	if slot1Result == 4 and slot2Result == 4 and slot3Result == 4:
		Stats.maxHealth = 1000;
		Stats.health = Stats.maxHealth;
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		intoTheRadius = false;
		print("You're not inside me :(");

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		intoTheRadius = true;
		print("You're inside me :)");
		
func _process(_delta: float) -> void:
	if Stats.mobile:
		if Stats.attacking and Input.is_action_just_pressed("BasicAttack") and intoTheRadius and not Stats.inDialogue and not rolling:
			rollDatShit();
	else:
		if !Stats.attacking and Input.is_action_just_pressed("BasicAttack") and intoTheRadius and not Stats.inDialogue and not rolling:
			rollDatShit();
