extends Node

class_name Infected

@export var enemies : Array[PackedScene]
@export var player : AnimationPlayer
func _ready():
	get_tree().create_timer(3).timeout.connect(explode)
	player.play("shake")
	
func explode():
	for enemy in enemies:
		var new_enemy = enemy.instantiate()
		SignalEvents.on_enemy_spawned.emit(new_enemy)
		new_enemy.global_position = owner.global_position
	player.play("Explode")
	await player.animation_finished
	owner.queue_free()
