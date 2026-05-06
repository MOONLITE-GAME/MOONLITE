extends RigidBody2D;

var inDestructionRadius:bool = false;

func _process(_delta: float) -> void:
	if !Stats.attacking and Input.is_action_just_pressed("Interact") and inDestructionRadius and not Stats.inDialogue:
		if !$VideoStreamPlayer.is_playing():
			$VideoStreamPlayer.visible = true;
			Stats.inDialogue = true;
			MusicEngine.stop();
			$VideoStreamPlayer.play();

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		inDestructionRadius = true;
		print("CharacterBody2D entered");

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		inDestructionRadius = false;
		print("CharacterBody2D exited");

func _on_video_stream_player_finished() -> void:
	$VideoStreamPlayer.visible = false;
	Stats.inDialogue = false;
	MusicEngine.play();
