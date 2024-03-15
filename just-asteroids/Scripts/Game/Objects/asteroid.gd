extends Area2D

class_name Asteroid

var screensize
var speed = 150
var direction := Vector2()
func _ready():
	screensize = get_viewport_rect().size
	direction = Vector2(randf_range(-1,1),randf_range(-1,1))
	
func _process(_delta):
	position = position.posmodv(screensize)

func _physics_process(delta):
	rotation_degrees += randf_range(0,TAU) * delta
	position += direction.normalized() * speed * delta
