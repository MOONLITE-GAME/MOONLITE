extends Node2D

var curFrame:int = 1;

func _ready() -> void:
	curFrame = 1;
	$AnimationPlayer.play("fade");
	
func _process(_delta: float) -> void:
	if curFrame < 10:
		$image.texture = load("res://assets/levels/bridge/images/tutorial/story/intro000" + str(curFrame) + ".png");
	else:
		$image.texture = load("res://assets/levels/bridge/images/tutorial/story/intro00" + str(curFrame) + ".png")
	
	
	if Input.is_action_just_pressed("uiSELECT"):
		curFrame = curFrame + 1;
		
		if curFrame == 16:
			get_tree().change_scene_to_file("res://source/scenes/levels/bridge/tutorial.tscn");
