extends Node

class_name HellManager

@export var timer: Timer

@export var marker: Node2D

@export var _primary: PackedScene

@export var bullet_count := 3

@export var radius := 50

@export var rate := 60

@export var pattern : Patterns = Patterns.SPIRAL

@export var freq := 1

var dir := Vector2()

var time = 0


# will work on rotaters if needed

var rotaters := []

#NOTE: main patterns are stored here. the enums are matched depending on the type of interpolation

enum Patterns {
	SPIRAL,
	SINECOS,
	SINE,
	COSINE,
	TANGENT,
	ACOS,
	AIM
}
