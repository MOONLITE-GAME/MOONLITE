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
	if Stats.maxHealth == 0:
		Stats.maxHealth = 100;
		Stats.health = 100;
		Stats.saveStats();
	Stats.attacking = false;
	loadChar();
	getWeapon();

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta;
		
		if not Stats.attacking and not Dash.dodging and not Stats.inDialogue:
			if dir == "Left":
				$AnimatedSprite2D.play(Stats.dodgeLeft);
			else:
				$AnimatedSprite2D.play(Stats.dodgeRight);

	SPEED = moveSpeed;
	
	if Input.is_action_just_pressed("Jump") and is_on_floor() and not Stats.inDialogue:
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("Left", "Right")
	if direction and not Stats.inDialogue:
		Stats.moving = true;
		velocity.x = direction * SPEED
		if not Stats.attacking and not Dash.dodging:
			if dir == "Left": 
				$AnimatedSprite2D.play(Stats.runLeft);
			else:
				$AnimatedSprite2D.play(Stats.runRight);
	else:
		Stats.moving = false;
		velocity.x = move_toward(velocity.x, 0, SPEED);
		if is_on_floor() and not Stats.attacking:
			if dir == "Left":
				$AnimatedSprite2D.play(Stats.idleLeft);
			else:
				$AnimatedSprite2D.play(Stats.idleRight);

	if Dash.dodging:
		match dir:
			"Left":
				$AnimatedSprite2D.play(Stats.dodgeLeft);
				velocity.x = -1 * dashSpeed;
			"Right":
				$AnimatedSprite2D.play(Stats.dodgeRight);
				velocity.x = 1 * dashSpeed;

	move_and_slide()
	
	if Input.is_action_just_pressed("Left") and not Stats.inDialogue:
		dir = "Left";
	elif Input.is_action_just_pressed("Right") and not Stats.inDialogue:
		dir = "Right";
		
	if Input.is_action_just_pressed("BasicAttack") and Stats.attacking == false and not Dash.dodging and not Stats.inDialogue:
		Stats.attacking = true;
		$AudioStreamPlayer.stream = $Weapon.baseAttackSound;
		$AudioStreamPlayer.play();
		match Stats.moving:
			true:
				match dir:
					"Left":
						$AnimatedSprite2D.play(Stats.attackRunLeft);
					"Right":
						$AnimatedSprite2D.play(Stats.attackRunRight);
			false:
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
		
	if Input.is_action_just_pressed("Dash") and not Stats.inDialogue:
		Dash.dodging = true;
	
	Stats.playerX = position.x; # TODO: Make sure these don't break the game when we implement warps to other rooms.
	Stats.playerY = position.y; # it happened with AGWYPaaB and broke some shit lmao
	
	
func loadChar():
	Stats.loadCharJSON();
	$AnimatedSprite2D.sprite_frames = load(Stats.assetPath);
	print("Now Playing as: " + Stats.character);
	
func getWeapon():
	if Stats.weapon == "":
		Stats.weapon = "Dark Sword";
		Stats.saveStats();
		getWeapon();
	
	print(Stats.weapon);
	match Stats.weapon:
		"Dark Sword":
			$Weapon.set_script(load("res://source/scripts/items/weapons/darkSword.gd"));
		"Rebounder": 
			$Weapon.set_script(load("res://source/scripts/items/weapons/Rebounder.gd"));
		"Ground Pound":
			$Weapon.set_script(load("res://source/scripts/items/weapons/groundPound.gd"));
			
	$Weapon._ready();
	Stats.weaponType = $Weapon.weaponType;
