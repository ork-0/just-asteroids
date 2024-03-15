extends CanvasLayer

@onready var start = %Start 
@onready var exit = %Exit 

func _ready():
	start.pressed.connect(on_start_button_pressed)
	exit.pressed.connect(on_exit_button_pressed)
func on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")

func on_exit_button_pressed():
	get_tree().quit()
