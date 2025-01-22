class_name Mob extends CharacterBody2D

var _player: player = null
@onready var detection_area: Area2D = %"Detection Area"
@export var max_speed := 200.0
@export var acceleration := 600
@export var health := 5: set = set_health
@onready var hitbox: Area2D = $Hitbox
var damage := 1
@onready var damage_timer: Timer = $DamageTimer

func _ready() -> void:
	detection_area.body_entered.connect(func (body: Node) -> void:
		if body is player:
			_player = body
	)
	detection_area.body_exited.connect(func (body: Node) -> void:
		if body is player:
			_player = null
	)
	hitbox.body_entered.connect(func (body: Node) -> void:
		if body is player:
			body.health -= damage
			damage_timer.start()
			)
	hitbox.body_exited.connect(func (body: Node) -> void:
		if body is player:
			damage_timer.stop()
			)
	damage_timer.timeout.connect(func () -> void:
		_player.health -= damage
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

func set_health(new_health: int) -> void:
	health = new_health
	if health <= 0:
		queue_free()
