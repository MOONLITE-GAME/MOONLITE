extends Weapon;

var bonkSpeed:float = 850;

func _ready():
	baseDamage = 100;
	attackCooldown = 0.1;
	baseAttackSound = load("res://assets/shared/sounds/items/weapons/hammerOfZoomin.ogg");
	exAttackSound = baseAttackSound;
	affectsVelocity = true;
	velocityTime = 1.5;
	weaponType = "Hammer";

func baseAttack():
	velocityX = -bonkSpeed;
	velocityY = -bonkSpeed;
