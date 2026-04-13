extends Node

var sliding:bool = false;
var duration:float = 0.4;

func slide():
	if sliding:
		await get_tree().create_timer(duration).timeout;
		sliding = false;
