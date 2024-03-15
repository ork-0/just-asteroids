extends CanvasLayer


@onready var restart_game = $Control/VBoxContainer/Restart
@onready var quit_game = $Control/VBoxContainer/Quit

func _ready():
	restart_game.pressed.connect(on_restart_pressed)
	quit_game.pressed.connect(on_quit_pressed)

func on_restart_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
func on_quit_pressed():
	get_tree().quit()
	
