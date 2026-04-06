class_name Item extends Node;

# item properties
var stackSize:int = 64;
var givesEffect:bool = false;
var heals:bool = false;
var itemSound:AudioStream = load("res://assets/shared/sounds/items/weapons/sword.ogg");
var itemType:String = "Speed Boost";

# stats for items that affect velocity. For example: a weapon that sends the player flying backwards.
var affectsVelocity:bool = false;
var velocityY:float;
var velocityX:float;
var velocityTime:float;

# effect stuff
var speed:float = 1.0;
var health:float = 1.0;

func useItem():
	print("Item Used!");
