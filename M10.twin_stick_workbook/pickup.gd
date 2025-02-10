@tool
class_name Pickup extends Area2D

@export var item: Item = null
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite_2d.texture = item.texture
	body_entered.connect(func(body: Node) -> void:
		if body is player:
			item.use(body)
			queue_free()
			)

func set_item(value: Item) -> void:
	item = value
	if sprite_2d != null:
		sprite_2d.texture = item.texture
	if audio_stream_player_2d != null:
		audio_stream_player_2d.stream = item.sound_on_pickup
