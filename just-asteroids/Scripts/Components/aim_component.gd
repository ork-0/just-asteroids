extends Node

class_name AimComponent

@export var _primary : PackedScene
@export var marker: Marker2D
@export var timer: Timer
var radius = 10
@export var bullet_count = 2
var step = TAU / bullet_count

func _ready():
	timer.timeout.connect(fire_target)
	for i in range(bullet_count):
		var spawner = Node2D.new()
		var pos = Vector2(radius,0).rotated(step * i)
		spawner.position = pos
		spawner.rotation = pos.angle()
		marker.add_child(spawner)

func fire_target():
	var target = get_tree().get_nodes_in_group("Player")
	for marker_origin in marker.get_children():
		var bullet = _primary.instantiate()
		SignalEvents.on_enemy_bullet_fired.emit(bullet)
		for player in target:
			marker_origin.rotation = marker_origin.global_position.direction_to(player.global_position).angle()
			var pos = Vector2.RIGHT.rotated(marker_origin.global_rotation)
			bullet.direction = pos
			bullet.position = marker_origin.global_position
