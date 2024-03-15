extends CharacterBody2D

@onready var fire_rate := $Fire_Rate
@onready var nozzle := $Nozzle
@onready var plyr_hitbox := $Hitbox
@export var _primary : PackedScene
@export var radius := 100.0
var speed = 150
var angle = 0
var bullet_count = 1
var step = TAU / bullet_count
var screensize
var dir = Vector2()
func _ready():
	fire_rate.timeout.connect(shoot)
	screensize = get_viewport_rect().size
	dir = Vector2(randf_range(-1.5,1),randf_range(1.5,-1))
func _process(delta):
	# loop through the viewport using posmod
	position = position.posmodv(screensize)

func _physics_process(delta):
	#position += dir * speed * delta
	look_at(get_global_mouse_position())
	rotation_degrees += 90

func _on_area_entered(area):
	print(area.name)
	queue_free()
	SignalEvents.on_game_over.emit()

func shoot():
	if Input.is_action_pressed("shoot"):
		for i in range(bullet_count):
			# bullets instantiated every time an action input is taken. varies based on powerup
			var bullet = _primary.instantiate()
			bullet.direction = Vector2.UP.rotated(global_rotation)
			bullet.position = nozzle.global_position
			bullet.rotation_degrees += 90
			SignalEvents.on_plyr_bullet_shot.emit(bullet)
