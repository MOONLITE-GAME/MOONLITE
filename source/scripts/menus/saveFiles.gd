extends Control

var curButton:int = 1;

func _ready() -> void:
	pass;

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("uiUP"):
		$AudioStreamPlayer.play();
		match curButton:
			1:
				$save1.play_backwards("save1 hover");
				$save3.play("save3 hover");
				curButton = 3;
			2:
				$save2.play_backwards("save2 hover");
				$save1.play("save1 hover");
				curButton = 1;
			3:
				$save3.play_backwards("save3 hover");
				$save2.play("save2 hover");
				curButton = 2;
	if Input.is_action_just_pressed("uiDOWN"):
		$AudioStreamPlayer.play();
		match curButton:
			1:
				$save1.play_backwards("save1 hover");
				$save2.play("save2 hover");
				curButton = 2;
			2:
				$save2.play_backwards("save2 hover");
				$save3.play("save3 hover");
				curButton = 3;
			3:
				$save3.play_backwards("save3 hover");
				$save1.play("save1 hover");
				curButton = 1;
