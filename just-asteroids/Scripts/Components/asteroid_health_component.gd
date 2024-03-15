extends Node

class_name AsteroidHealthComponent

@export var health:= 100.0


func on_hit(damage: float):
	health -= damage
		
