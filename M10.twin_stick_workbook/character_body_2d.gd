class_name player extends CharacterBody2D


@export var SPEED = 450.0
@export var JUMP_VELOCITY = -400.0
var max_health := 10
var health := max_health: set = set_health
@onready var health_bar: ProgressBar = $HealthBar
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	health_bar.max_value = max_health
	health_bar.value = health
	
func _physics_process(delta: float) -> void:
	var move_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = SPEED * move_direction
	move_and_slide()

func set_health(new_health: int) -> void:
	var previous_health := health
	health = clampi(new_health, 0, max_health)
	health_bar.value = health
	if health == 0:
		die()

func die() -> void:
	queue_free()
	collision_shape_2d.set_deferred("disabled", true)
