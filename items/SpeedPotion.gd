class_name SpeedPotion
extends Item

@export var speed : int = 110

func _init():
	item_name = "Speed Potion"
	type = ItemType.SPEED

func pick_up(_player: Player, number_of_picked: int) -> void:
	_player.speed += speed_to_add(number_of_picked)
	queue_free()
	print("speed potion picked up: ", number_of_picked)

func speed_to_add(number_of_picked: int) -> int:
	return max(10, speed - 10 * number_of_picked)
