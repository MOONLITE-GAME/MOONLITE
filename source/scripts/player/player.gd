extends CharacterBody2D

var SPEED:float;
const dashSpeed = 3000.0;
const moveSpeed = 800.0;
const JUMP_VELOCITY = -600.0
const dodgeDuration = 0.2;
var dir:String;
var defaultAFKTime:float = 60.0;
var afkEasterEggTime:float = defaultAFKTime;

func _ready() -> void:
	dir = "Right";
	if Stats.playerX != 0:
		position.x = Stats.playerX;
	if Stats.playerY != 0:
		position.y = Stats.playerY;
	loadChar();

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	SPEED = moveSpeed;
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if not Stats.attacking: # TODO: add conditional for dashing when that's implemented
			if dir == "Left": 
				$AnimatedSprite2D.play(Stats.runLeft);
			else:
				$AnimatedSprite2D.play(Stats.runRight);
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED);
		if is_on_floor() and not Stats.attacking:
			if dir == "Left":
				$AnimatedSprite2D.play(Stats.idleLeft);
			else:
				$AnimatedSprite2D.play(Stats.idleRight);

	move_and_slide()
	
	if Input.is_action_just_pressed("Left"):
		dir = "Left";
	elif Input.is_action_just_pressed("Right"):
		dir = "Right";
	
func loadChar():
	Stats.loadCharJSON();
	$AnimatedSprite2D.sprite_frames = load(Stats.assetPath);
	print("Now Playing as: " + Stats.character);
