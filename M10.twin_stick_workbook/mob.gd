class_name Mob extends CharacterBody2D

var _player: player = null
@onready var detection_area: Area2D = %"Detection Area"
@export var max_speed := 200.0
@export var acceleration := 600
func _ready() -> void:
	detection_area.body_entered.connect(func (body: Node) -> void:
		if body is player:
			_player = body
	)
	detection_area.body_exited.connect(func (body: Node) -> void:
		if body is player:
			_player = null
	)
func get_global_player_position() -> Vector2:
	return get_tree().root.get_node("test/Player").global_position

func _physics_process(delta: float) -> void:
	if _player == null:
		velocity = velocity.move_toward(Vector2.ZERO, acceleration * delta)
	else:
		var direction := global_position.direction_to(get_global_player_position())
		var distance := global_position.direction_to(get_global_player_position())
		var speed := max_speed
		var desired_velocity := direction * speed
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)
		move_and_slide()
