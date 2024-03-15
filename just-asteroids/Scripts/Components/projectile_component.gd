extends Node

class_name Projectile

@export var speed := 500.0
var direction := Vector2()
func _physics_process(delta):
	owner.global_position += direction * speed * delta

