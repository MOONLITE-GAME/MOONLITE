extends Control;

var startUp:bool = true;
var saving:bool = false;

var weaponName:String;
var damage:float;
var attackCooldown:float;
var weaponType:String;
var weaponSound:String;
var velocityTime:float;

func _ready() -> void:
	startUp = true;
	$welcomePopUp.visible = true;

func _on_new_pressed() -> void:
	startUp = false;
	$welcomePopUp.visible = false;

func _on_open_pressed() -> void:
	pass # Replace with function body.

func _on_name_text_changed() -> void:
	weaponName = $ui/name.text;

func _on_damage_num_value_changed(value: float) -> void:
	damage = value;

func _on_cooldown_value_changed(value: float) -> void:
	attackCooldown = value;

func _on_weapon_type_item_selected(index: int) -> void:
	match index:
		0:
			weaponType = "Sword";
		1:
			weaponType = "Hammer"
		2:
			weaponType = "Ground Pound";
		3:
			weaponName = "Projectile";

func _on_save_pressed() -> void:
	saving = true;
	$FileDialog.visible = true;

func _on_file_dialog_file_selected(path: String) -> void:
	SaveIcon.showIcon();
	
	var file = FileAccess.open(path, FileAccess.WRITE);
	
	var data = {};
	
	data.weaponName = weaponName;
	data.damage = damage;
	data.attackCooldown = attackCooldown;
	data.weaponType = weaponType;
	data.weaponSound = weaponSound;
	data.velocityTime = velocityTime;
	
	var jsonString = JSON.stringify(data);
	file.store_string(jsonString);
	
	saving = false;
	$FileDialog.visible = false;

func _on_audio_pressed() -> void:
	$Audio.visible = true;

func _on_audio_file_selected(path: String) -> void:
	weaponSound = path;
	$Audio.visible = false;

func _on_velocity_time_value_changed(value: float) -> void:
	velocityTime = value;

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/mainMenu.tscn");
	MusicEngine.loadSong("titleScreen");
