extends Node2D

@onready var teleporter: Area2D = %Teleporter
@onready var end_screen: Control = %EndScreen

func _ready() -> void:
	teleporter.body_entered.connect(func (body: Node) -> void:
		if body is player:
			end_screen.open()
			)
