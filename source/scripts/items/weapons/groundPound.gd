extends Weapon;

var gravitySpd:float = 100000.0;

func _ready():
	baseDamage = 500;
	attackCooldown = 3.0;
	baseAttackSound = load("res://assets/shared/sounds/items/weapons/hammerOfZoomin.ogg");
	exAttackSound = baseAttackSound;
	affectsVelocity = true;
	velocityTime = 2.5;
	weaponType = "Ground Pound";

func baseAttack():
	velocityY = gravitySpd;
