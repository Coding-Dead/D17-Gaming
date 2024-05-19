class_name HealItem
extends Item

@export var hp : int = 100

func _init():
	item_name = "Heal Potion"
	type = ItemType.HEALTH

func pick_up(_player : Player) -> void:
	print("heal item picked up")
	_player.curr_health += hp
	queue_free()
