extends Node2D

@onready var teleporter: Area2D = %Teleporter
@onready var end_screen: Control = %EndScreen
@onready var player: player = $Player

func _ready() -> void:
	teleporter.body_entered.connect(func (body: Node) -> void:
		if body is player:
			end_screen.open()
			player.set_physics_process(false)
			)
