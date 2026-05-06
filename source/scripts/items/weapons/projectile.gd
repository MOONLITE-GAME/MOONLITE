class_name Projectile extends Node2D

var speed:float = 1.0;
var moveDuration:float = 1.0;

func moveLeft():
	position.x = position.x - speed;

func moveRight():
	position.x = position.x + speed;
