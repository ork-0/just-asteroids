extends Node

class_name PlayerHealthComponent

@export var health:= 50.0

func on_hit(damage: float):
	health -= damage
		
