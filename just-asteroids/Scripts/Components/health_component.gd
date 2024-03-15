extends Node

class_name HealthComponent

@export var health:= 100.0
@export var player : AnimationPlayer
var character
func _ready():
	character = get_tree().get_nodes_in_group("Player")

func on_hit(damage: float):
	health -= damage
	for main_player in character:
		if !main_player && health <= 0:
			player.play("Explode")
			owner.queue_free()
		elif main_player && health <= 0:
			player.play("Explode")
			owner.queue_free()
