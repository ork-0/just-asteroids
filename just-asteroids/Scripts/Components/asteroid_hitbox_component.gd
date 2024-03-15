extends Node

class_name AsteroidHitbox

@export var healthcomp : AsteroidHealthComponent
@export var asteroid_container : PackedScene
@export var player : AnimationPlayer


func take_damage(damage:float):
	if healthcomp:
		healthcomp.on_hit(damage)
	if healthcomp.health == 0:
		player.play("Explode")
		owner.queue_free()
		for i in range(2):
			var asteroid = asteroid_container.instantiate()
			asteroid.position = owner.global_position + Vector2(20,0)
			SignalEvents.on_asteroid_exploded.emit(asteroid)
		
		
