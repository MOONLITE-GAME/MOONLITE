extends CharacterBody2D


var SPEED:float;
const dashSpeed = 3000.0;
const moveSpeed = 800.0;
const JUMP_VELOCITY = -600.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	SPEED = moveSpeed;
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
