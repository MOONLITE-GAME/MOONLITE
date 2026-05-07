extends StaticBody2D

var intoTheRadius:bool = false; # shout out vr gaymers
var damage:int = 10;
var time:float = 2.0;

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		intoTheRadius = false;

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		intoTheRadius = true;
		Stats.health = Stats.health - damage;
