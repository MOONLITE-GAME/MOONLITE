extends Node2D

var inside:bool = false;

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		inside = true;

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		inside = false;
		
func _process(_delta: float) -> void:
	if inside:
		if Input.is_action_just_pressed("Interact") and not Stats.attacking and not Stats.inDialogue:
			Stats.inDialogue = true;
			Dialogic.start("3dMoonlite");
	
	if Dialogic.VAR.isDone == true and Stats.inDialogue:
		Dialogic.VAR.isDone = false;
		Stats.inDialogue = false;
