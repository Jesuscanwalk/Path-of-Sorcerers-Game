extends Node2D

@onready var weapon_anchor: Marker2D = %WeaponAnchor

func _process(delta: float) -> void:
	var aim_direction := Vector2.ZERO
	aim_direction = global_position.direction_to(get_global_mouse_position())
	if aim_direction.length() > 0.1:
		rotation = aim_direction.angle()
