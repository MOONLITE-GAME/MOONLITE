extends Node2D

const tutorial = preload("res://source/scenes/levels/bridge/tutorial.tscn");

func _ready() -> void:
	$AnimationPlayer.play("fadein");
	$AnimatedSprite2D.play("moonlite intro animation full");
	Camera.position = Vector2(415, 754);
	Camera.zoom = Vector2(1.675, 1.675);

func _on_animated_sprite_2d_animation_finished() -> void:
	await get_tree().create_timer(0.3).timeout;
	$AnimationPlayer.play_backwards("fadein");
	await get_tree().create_timer(0.3).timeout;
	get_tree().change_scene_to_packed(tutorial);


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	pass # Replace with function body.
