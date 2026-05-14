extends Node2D

var goTime:float = 10.0;
var slowTime:float = 3.0;
var stopTime:float = 30.0;

func _ready() -> void:
	lightCycle();

func lightCycle():
	$stopLight.texture = load("res://assets/images/menus/charSelect/bg/moonlite/greenLight.png");
	await get_tree().create_timer(goTime).timeout;
	$stopLight.texture = load("res://assets/images/menus/charSelect/bg/moonlite/yellowLight.png");
	await get_tree().create_timer(slowTime).timeout;
	$stopLight.texture = load("res://assets/images/menus/charSelect/bg/moonlite/redLight.png");
	await get_tree().create_timer(stopTime).timeout;
	lightCycle();
