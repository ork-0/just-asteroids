extends Node

@export var asteroids : Array [PackedScene]
var set_count = 7
var screen_size
var state : DifficultyState.depth
var new_depth : int
var diff : int
func _ready():
	randomize()
	screen_size = get_viewport().get_visible_rect().size
	SignalEvents.connect("on_asteroid_exploded",_on_asteroid_exploded)
	SignalEvents.connect("on_asteroids_cleared",_on_asteroids_cleared)
	SignalEvents.connect("on_game_over",reset_depth)
	state = DifficultyState.depth.SHALLOW
	for i in range(set_count):
		spawn_asteroid()

func _process(delta):
	RenderingServer.global_shader_parameter_set("depth_index",new_depth)
	asteroids.shuffle()
	match DifficultyState.depth:
		DifficultyState.depth.SURFACE:
			diff = 0
		DifficultyState.depth.SHALLOW:
			diff = randi_range(0,2)
		DifficultyState.depth.DEEP:
			diff = randi_range(0,3)
		DifficultyState.depth.TRENCH:
			diff = randi_range(0,4)
		DifficultyState.depth.ABYSS:
			diff = randi_range(0,asteroids.size())
func reset_depth():
	new_depth = 0

func _on_asteroids_cleared():
	await get_tree().create_timer(2)
	state += 1
	new_depth += 1
	set_count += 1
	for i in range(set_count):
		spawn_asteroid()

func spawn_asteroid():
		var roid = asteroids[diff].instantiate()
		call_deferred("add_child",roid)
		print(state)

func _on_asteroid_exploded(asteroid):
	call_deferred("add_child",asteroid)
	
