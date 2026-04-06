extends Weapon;

var bonkSpeed:float = 8000.0;

func _ready():
	baseDamage = 100;
	attackCooldown = 1;
	baseAttackSound = load("res://assets/shared/sounds/items/weapons/hammerOfZoomin.ogg");
	exAttackSound = baseAttackSound;
	affectsVelocity = true;
	velocityTime = 5.0;
	weaponType = "Hammer";

func baseAttack():
	velocityX = -bonkSpeed;
	velocityY = -bonkSpeed;
