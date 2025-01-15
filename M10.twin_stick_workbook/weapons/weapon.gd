class_name Weapon extends Node2D

@export var bullet_scene: PackedScene = preload("res://weapons/bullets/bullet.tscn")
@export var max_range := 1000
@export var max_bullet_speed := 400
@export_range(0, 360, 0.1, "radians_as_degrees")var random_angle := PI / 7.0

func shoot():
	var bullet: Node = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = global_position
	bullet.global_rotation = global_rotation
	bullet.max_range = max_range
	bullet.speed = max_bullet_speed
	bullet.rotation += randf_range(-random_angle / 2.0, random_angle / 2.0)
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
