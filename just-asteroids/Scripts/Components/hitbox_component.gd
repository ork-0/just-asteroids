extends Node

class_name HitboxComponent

@export var healthcomp: HealthComponent

func take_damage(damage:float):
	if healthcomp:
		healthcomp.on_hit(damage)
