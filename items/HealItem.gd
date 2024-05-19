class_name HealItem
extends Item

@export var hp : int = 100

func _init():
	item_name = "Heal Potion"
	type = ItemType.HEALTH

func pick_up(_player: Player, number_of_picked: int) -> void:
	var health = _player.curr_health
	_player.curr_health = min(health + health_to_add(number_of_picked), 1000)
	queue_free()
	print("heal item picked up: ", number_of_picked)

func health_to_add(number_of_picked: int) -> int:
	return hp
