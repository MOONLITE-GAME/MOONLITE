extends Control

func _ready() -> void:
	setHealth(Stats.health);
	Stats.loadCharJSON();
	updateWeapon();
	$charName.text = Stats.charName;
	
	if !Stats.mobile:
		$mobile.visible = false;

func _process(_delta: float) -> void:
	pass;
	
func setHealth(health):
	$healthBar.value = health;

func updateWeapon():
	$weaponName.text = Stats.weapon;
	
	match Stats.weaponType:
		"Sword":
			$weaponIcon.texture = load("res://assets/shared/images/hud/weaponIcons/sword.png");
		"Hammer":
			$weaponIcon.texture = load("res://assets/shared/images/hud/weaponIcons/hammer.png");
		"Ground Pound":
			$weaponIcon.texture = load("res://assets/shared/images/hud/weaponIcons/groundPound.png");


func _on_jump_pressed() -> void:
	Input.action_press("Jump");

func _on_slide_pressed() -> void:
	Input.action_press("Slide");

func _on_left_pressed() -> void:
	Input.action_press("Left");

func _on_right_pressed() -> void:
	Input.action_press("Right");

func _on_interact_pressed() -> void:
	Input.action_press("Interact");

func _on_attack_pressed() -> void:
	Input.action_press("BasicAttack");
