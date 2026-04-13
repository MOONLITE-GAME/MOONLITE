extends Node

var sliding:bool = false;
var duration:float = 0.4;
var slideDone:bool = false;

func slide():
	if sliding:
		slideDone = false;
		await get_tree().create_timer(duration).timeout;
		slideDone = true;
