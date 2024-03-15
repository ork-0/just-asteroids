extends Node
# jesus christ that's a lot of onready variables
@onready var plyr_projectiles = $Player_Projectiles
@onready var enmy_projectiles = $Enemy_Projectiles
@onready var asteroids = $Asteroids
@onready var enemies = $Enemies
@onready var asteroids_remaining = $UI/Panel/VBoxContainer/Label
@onready var game_over_screen = $Game_Over_Screen
func _ready():
	SignalEvents.connect("on_plyr_bullet_shot",_on_bullet_fired)
	SignalEvents.connect("on_enemy_bullet_fired", _on_enemy_bullet_fired)
	SignalEvents.connect("on_enemy_spawned", on_infected_exploded)
	SignalEvents.connect("on_game_over", game_over)
	SignalEvents.connect("on_win", _on_win)
	start_game()

func start_game():
	#just so everything doesn't get super stinky
	get_tree().call_group("Asteroids", "queue_free")
	get_tree().call_group("Enemy", "queue_free")
	asteroids_remaining.text = str(asteroids.get_children().size())
	game_over_screen.hide()

func game_over():
	game_over_screen.show()

func _on_win():
	get_tree().change_scene_to_file("res://Scenes/Game/UI/win.tscn")

func _process(delta):
	asteroids_remaining.text = str(asteroids.get_children().size())
	if asteroids.get_children().size() <= 0 && enemies.get_children().size() <= 0:
		SignalEvents.on_asteroids_cleared.emit()
	elif asteroids.get_children().size() <= 0 && enemies.get_children().size() <= 0 && DifficultyState.depth.ABYSS:
		SignalEvents.on_win.emit()
func on_infected_exploded(enemy):
	enemies.call_deferred("add_child",enemy)

func _on_bullet_fired(bullet):
	plyr_projectiles.call_deferred("add_child",bullet)

func _on_enemy_bullet_fired(bullet):
	enmy_projectiles.call_deferred("add_child", bullet)
