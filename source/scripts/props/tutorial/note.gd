extends Area2D

@export var dialogue:String;

var inRadius:bool = false;
var showingIMG:bool = false;

func _process(_delta: float) -> void:
	if Stats.mobile:
		if Stats.attacking and Input.is_action_just_pressed("Interact") and inRadius and not Stats.inDialogue:
			showingIMG = true;
			Stats.inDialogue = true;
			#Dialogic.start(dialogue);
	else:
		if !Stats.attacking and Input.is_action_just_pressed("Interact") and inRadius and not Stats.inDialogue:
			showingIMG = true;
			Stats.inDialogue = true;
			#Dialogic.start(dialogue);
		#if Dialogic.VAR.isDone == true and Stats.inDialogue:
			#Dialogic.VAR.isDone = false;
			#Stats.inDialogue = false;
	if Input.is_action_just_pressed("uiEXIT"):
		showingIMG = false;
		await get_tree().create_timer(0.5).timeout
		Stats.inDialogue = false;
		
	$CanvasLayer.visible = showingIMG;


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		inRadius = true;
		
func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		inRadius = false;
