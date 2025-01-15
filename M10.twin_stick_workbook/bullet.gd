class_name Bullet extends Area2D

@export var speed := 340
var max_range := 600
var _traveled_distance = 0.0

func _process(delta: float) -> void:
	var distance := speed * delta
	var motion := Vector2.RIGHT.rotated(rotation) * distance
	position += motion
	_traveled_distance += distance
	if _traveled_distance > max_range:
		_destroy()

func _destroy():
	queue_free()
