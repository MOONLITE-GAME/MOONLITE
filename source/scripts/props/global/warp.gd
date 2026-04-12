class_name Warp extends Area2D;

@export var targetRoom:String;
@export var targetX:float;
@export var targetY:float;
var inside:bool = false;

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		inside = false;

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		inside = true;
