extends RigidBody2D;

var inDestructionRadius:bool = false;

func _process(_delta: float) -> void:
	if !Stats.attacking and (Input.is_action_just_pressed("BasicAttack") or Input.is_action_just_pressed("Interact")) and inDestructionRadius and not Stats.inDialogue:
		if !$AudioStreamPlayer2D.playing:
			MusicEngine.stop();
			Stats.inDialogue = true;
			AudioEngine.loadSound("radio/radioStatic");
			$AudioStreamPlayer2D.play();
			$AnimatedSprite2D.play("radio");
			await get_tree().create_timer($AudioStreamPlayer2D.stream.get_length()).timeout;
			AudioEngine.loadSound("radio/radioStatic");
			Stats.inDialogue = false;
			$AudioStreamPlayer2D.stop();
			$AnimatedSprite2D.play("radio off");
			MusicEngine.play();
			AudioEngine.loadSound("boom");
			self.queue_free();

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		inDestructionRadius = true;
		print("CharacterBody2D entered");

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		inDestructionRadius = false;
		print("CharacterBody2D exited");
