class_name healing_item extends Item

@export var healing_amount := 1

func use(Player: player) -> void:
	Player.health += healing_amount
