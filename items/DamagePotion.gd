class_name DamagePotion
extends Item

@export var damage : int = 6

func _init():
	item_name = "Damage Potion"
	type = ItemType.DAMAGE

func pick_up(_player: Player, number_of_picked: int) -> void:
	_player.damage += damage_to_add(number_of_picked)
	queue_free()
	print("damage potion picked up: ", number_of_picked)


func damage_to_add(number_of_picked: int) -> int:
	return max(2, damage - number_of_picked)
