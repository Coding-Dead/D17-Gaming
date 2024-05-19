class_name HealItem
extends Item

@export var hp : int = 50

func _init():
	item_name = "Heal Potion"
	type = ItemType.HEALTH

func pick_up(_player: Player, number_of_picked: int) -> void:
	var health = _player.curr_health
	_player.curr_health = min(health + health_to_add(number_of_picked), _player.max_health)
	_player.update_health()
	queue_free()
	

func health_to_add(number_of_picked: int) -> int:
	return hp
