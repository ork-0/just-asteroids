extends CharacterBody2D

var direction = Vector2()
var speed = 150
var target
var screensize
func _ready():
	screensize = get_viewport_rect().size
	direction = Vector2(randf_range(150.0,200.0),randf_range(150.0,300.0))
func _process(_delta):
	position = position.posmodv(screensize)
		
func _physics_process(delta):
	rotation_degrees += randf_range(0,TAU) * delta
	position += direction.normalized() * speed * delta
