extends Control

func _ready() -> void:
	setHealth(Stats.health);
	Stats.loadCharJSON();
	updateWeapon();
	$charName.text = Stats.charName;
	
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
