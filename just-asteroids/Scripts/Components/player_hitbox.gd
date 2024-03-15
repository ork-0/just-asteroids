extends Node

class_name PlayerHitboxComponent

@export var healthcomp: PlayerHealthComponent

func take_damage(damage:float):
	if healthcomp:
		healthcomp.on_hit(damage)
