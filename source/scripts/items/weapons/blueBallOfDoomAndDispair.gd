extends Weapon;

func _ready() -> void:
	baseDamage = 20;
	attackCooldown = 5.0;
	speed = 100.0;
	weaponType = "Projectile";
