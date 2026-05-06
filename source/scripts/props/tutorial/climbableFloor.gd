extends StaticBody2D;

func _on_edge_left_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		Stats.canClimb = true;
		print("Can Climb");

func _on_edge_left_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		Stats.canClimb = false;
		print("Can't Climb");

func _on_edge_right_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		Stats.canClimb = true;
		print("Can Climb");

func _on_edge_right_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		Stats.canClimb = false;
		print("Can't Climb");
