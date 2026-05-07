extends Control;

var startUp:bool = true;

func _ready() -> void:
	startUp = true;
	$welcomePopUp.visible = true;

func _on_new_pressed() -> void:
	startUp = false;
	$welcomePopUp.visible = false;

func _on_open_pressed() -> void:
	pass # Replace with function body.
