extends Control

var scrollSpeed:float = 100.0;

func _process(delta: float) -> void:
	$credits.position.y -= delta * scrollSpeed;
	
	if $credits.position.y <= -2309:
		get_tree().change_scene_to_file("res://source/scenes/menus/mainMenu.tscn");
