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
	getWeapon();

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
		
	if Input.is_action_just_pressed("BasicAttack") and Stats.attacking == false:
		Stats.attacking = true;
		$AudioStreamPlayer.stream = $Weapon.baseAttackSound;
		$AudioStreamPlayer.play();
		match dir:
			"Left":
				$AnimatedSprite2D.play(Stats.attackLeft);
			"Right":
				$AnimatedSprite2D.play(Stats.attackRight);
		$Weapon.baseAttack();

		if $Weapon.affectsVelocity == true:
			if dir == "Left":
				velocity.x = $Weapon.velocityX;
				velocity.y = $Weapon.velocityY;
			if dir == "Right":
				velocity.x = -$Weapon.velocityX;
				velocity.y = $Weapon.velocityY;

			await get_tree().create_timer($Weapon.velocityTime).timeout;
			velocity.x = 0;
			velocity.y = 0;

		else:
			await get_tree().create_timer($Weapon.attackCooldown).timeout;

		Stats.attacking = false;
	
func loadChar():
	Stats.loadCharJSON();
	$AnimatedSprite2D.sprite_frames = load(Stats.assetPath);
	print("Now Playing as: " + Stats.character);
	
func getWeapon():
	print(Stats.weapon);
	match Stats.weapon:
		"Dark Sword":
			$Weapon.set_script(load("res://source/scripts/items/weapons/darkSword.gd"));
			
	$Weapon._ready();
