extends Control

var page:String = "Video";

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("uiEXIT"):
		_on_exit_pressed();
		
	match page:
		"Video":
			$video.texture_normal = load("res://assets/images/menus/options/buttonsPressed/video.png");
			$audio.texture_normal = load("res://assets/images/menus/options/buttonsNormal/audio.png");
			$controls.texture_normal = load("res://assets/images/menus/options/buttonsNormal/controls.png");
			$other.texture_normal = load("res://assets/images/menus/options/buttonsNormal/other.png");
			$exit.texture_normal = load("res://assets/images/menus/options/buttonsNormal/exit.png");
			$"Video Settings".visible = true;
			$"Audio Settings".visible = false;
			$"Control Settings".visible = false;
			$"Other Settings".visible = false;
		"Audio":
			$video.texture_normal = load("res://assets/images/menus/options/buttonsNormal/video.png");
			$audio.texture_normal = load("res://assets/images/menus/options/buttonsPressed/audio.png");
			$controls.texture_normal = load("res://assets/images/menus/options/buttonsNormal/controls.png");
			$other.texture_normal = load("res://assets/images/menus/options/buttonsNormal/other.png");
			$exit.texture_normal = load("res://assets/images/menus/options/buttonsNormal/exit.png");
			$"Video Settings".visible = false;
			$"Audio Settings".visible = true;
			$"Control Settings".visible = false;
			$"Other Settings".visible = false;
		"Controls":
			$video.texture_normal = load("res://assets/images/menus/options/buttonsNormal/video.png");
			$audio.texture_normal = load("res://assets/images/menus/options/buttonsNormal/audio.png");
			$controls.texture_normal = load("res://assets/images/menus/options/buttonsPressed/controls.png");
			$other.texture_normal = load("res://assets/images/menus/options/buttonsNormal/other.png");
			$exit.texture_normal = load("res://assets/images/menus/options/buttonsNormal/exit.png");
			$"Video Settings".visible = false;
			$"Audio Settings".visible = false;
			$"Control Settings".visible = true;
			$"Other Settings".visible = false;
		"Other":
			$video.texture_normal = load("res://assets/images/menus/options/buttonsNormal/video.png");
			$audio.texture_normal = load("res://assets/images/menus/options/buttonsNormal/audio.png");
			$controls.texture_normal = load("res://assets/images/menus/options/buttonsNormal/controls.png");
			$other.texture_normal = load("res://assets/images/menus/options/buttonsPressed/other.png");
			$exit.texture_normal = load("res://assets/images/menus/options/buttonsNormal/exit.png");
			$"Video Settings".visible = false;
			$"Audio Settings".visible = false;
			$"Control Settings".visible = false;
			$"Other Settings".visible = true;

func _on_video_pressed() -> void:
	page = "Video";

func _on_audio_pressed() -> void:
	page = "Audio";

func _on_controls_pressed() -> void:
	page = "Controls";

func _on_other_pressed() -> void:
	page = "Other";

func _on_exit_pressed() -> void:
	Stats.saveStats();
	get_tree().change_scene_to_file("res://source/scenes/menus/mainMenu.tscn");

# VIDEO SETTINGS
func _on_fullscreen_toggled(toggled_on: bool) -> void:
	Stats.fullscreen = toggled_on;
	Stats.saveStats();
	Stats.loadStats();

func _on_freecam_toggled(toggled_on: bool) -> void:
	Camera.freeCam = toggled_on;
	Stats.saveStats();
	Stats.loadStats();

# OTHER SETTINGS
func _on_save_file_pressed() -> void:
	get_tree().change_scene_to_file("res://source/scenes/menus/saveFiles.tscn");
	MusicEngine.stopMusic();
