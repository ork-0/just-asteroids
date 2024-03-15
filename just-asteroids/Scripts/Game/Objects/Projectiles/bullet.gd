extends Area2D

@export var speed := 500
@onready var visible_on_screen_notifier := $VisibleOnScreenNotifier2D
@export var lifetime: Timer
var damage = 50.0
var direction := Vector2()
var asteroid_target
var rigidbody : RigidBody2D
var screensize
func _ready():
	visible_on_screen_notifier.connect("screen_exited", queue_free)
	lifetime.timeout.connect(on_lifetime_timeout)
	area_entered.connect(_on_area_entered)
	asteroid_target = get_tree().get_nodes_in_group("Asteroids")

func _physics_process(delta):
	position += direction * speed * delta
	if has_overlapping_bodies():
		rigidbody.apply_central_force(-rigidbody.get_normal() * 500)

func _on_area_entered(area):
	if area is AsteroidHitbox:
		var asteroidhitbox = area
		asteroidhitbox.take_damage(damage)
		queue_free()
	
	if area is HitboxComponent:
		var hitbox = area
		hitbox.take_damage(damage)
		queue_free()
	
func on_lifetime_timeout():
	queue_free()

