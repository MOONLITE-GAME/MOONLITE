class_name Weapon extends Item;

# basic weapon stats
var baseDamage:int = 0;
var attackCooldown:float = 0.0;
var baseAttackSound:AudioStream = load("res://assets/shared/sounds/attack.ogg");
var exAttackSound:AudioStream = load("res://assets/shared/sounds/attack.ogg");
var weaponType:String = "Sword";

func baseAttack():
	print(baseDamage);

func exAttack():
	pass;
