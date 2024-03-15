extends CanvasLayer

@onready var restart_button = %Restart
@onready var back_button = %Back

func _ready():
	restart_button.pressed.connect(on_restart_button_pressed)
	back_button.pressed.connect(on_back_button_pressed)

func on_restart_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")

func on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game/UI/start_menu.tscn")
