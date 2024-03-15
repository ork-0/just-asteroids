extends Node

class_name InputComponent

@export var speed := 100.0

func _physics_process(delta):
	plyr_controller()
	owner.move_and_slide()
	
func plyr_controller():
	var direction = Vector2(Input.get_axis("left","right"),Input.get_axis("up","down"))
	owner.velocity = direction.normalized() * speed

