class_name player extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var move_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = SPEED * move_direction
	move_and_slide()
