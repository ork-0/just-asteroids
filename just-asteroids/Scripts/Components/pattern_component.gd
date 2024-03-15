extends HellManager

class_name PatternComponent

#NOTE: Most of the logic is from bitbirdy's bullethell tutorial
# I just moved it over to a seperate component for organization's sake

func _ready():
	var step = TAU / bullet_count
	timer.timeout.connect(_on_timer_timeout)
	
	for i in range(bullet_count):
		var origin = Node2D.new()
		# rotate the nodes by the number of bullets in the array multiplied by the step. fuck trigonometry.
		var position = Vector2(radius,0).rotated(step * i)
		origin.position = position
		origin.rotation = position.angle()
		marker.add_child(origin)

func _physics_process(delta):
	time += delta
	match pattern:
		Patterns.SPIRAL:
			dir = Vector2.RIGHT
			var marker_rotation = marker.rotation_degrees + rate * delta
			marker.rotation_degrees = fmod(marker_rotation,360)
		Patterns.SINECOS:
			dir = Vector2(cos(time * freq),sin(time * freq))
			var marker_rotation = marker.rotation_degrees + rate * delta
			marker.rotation_degrees = fmod(marker_rotation,360)
		Patterns.SINE:
			dir = Vector2(0,sin(time * freq))
			var marker_rotation = marker.rotation_degrees + rate * delta
			marker.rotation_degrees = fmod(marker_rotation,360)
		Patterns.COSINE:
			dir = Vector2(cos(time * freq),0)
			var marker_rotation = marker.rotation_degrees + rate * delta
			marker.rotation_degrees = fmod(marker_rotation,360)
		Patterns.TANGENT:
			dir = Vector2(cos(time * freq),tan(time * freq))
			var marker_rotation = marker.rotation_degrees + rate * delta
			marker.rotation_degrees = fmod(marker_rotation,360)
		Patterns.ACOS:
			dir = Vector2(acos(time * freq),sin(time * freq))
			var marker_rotation = marker.rotation_degrees + rate * delta
			marker.rotation_degrees = fmod(marker_rotation,360)
#region instance handler

func _on_timer_timeout() -> void:
	for marker_origin in marker.get_children():
		var bullet = _primary.instantiate()
		bullet.set_collision_mask_value(1,false)
		bullet.set_collision_mask_value(4, true)
		#start shooting!
		SignalEvents.on_enemy_bullet_fired.emit(bullet)
		bullet.direction = dir.rotated(marker_origin.global_rotation)
		bullet.position = marker_origin.global_position
		
#endregion
