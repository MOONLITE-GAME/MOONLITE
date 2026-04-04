extends Control

func _ready() -> void:
	setHealth(Stats.health);
	Stats.loadCharJSON();
	$charName.text = Stats.charName;
	
func setHealth(health):
	$healthBar.value = health;

func _process(_delta: float) -> void:
	updateWeapon();

func updateWeapon():
	$weaponName.text = Stats.weapon;
	
	match Stats.weaponType:
		"Sword":
			$weaponIcon.texture = "res://assets/shared/images/hud/weaponIcons/sword.png";
		"Hammer":
			$weaponIcon.texture = "res://assets/shared/images/hud/weaponIcons/hammer.png";
		"Ground Pound":
			$weaponIcon.texture = "res://assets/shared/images/hud/weaponIcons/groundPound.png";
