extends RigidBody2D;

var inDestructionRadius:bool = false;

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		inDestructionRadius = true;
		print("CharacterBody2D entered");

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		inDestructionRadius = false;
		print("CharacterBody2D exited");
	
func _process(_delta: float) -> void:
	if Stats.mobile:
		if !Stats.attacking and Input.is_action_just_pressed("BasicAttack") and inDestructionRadius and not Stats.inDialogue:
			AudioEngine.loadSound("crateSmash");
			self.queue_free();
		else:
			if Stats.attacking and Input.is_action_just_pressed("BasicAttack") and inDestructionRadius and not Stats.inDialogue:
				AudioEngine.loadSound("crateSmash");
				self.queue_free();
