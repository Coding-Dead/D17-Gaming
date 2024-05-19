class_name DamagePotion
extends Item

@export var damage : int = 10

func _init():
	item_name = "Damage Potion"
	type = ItemType.DAMAGE

func pick_up(_player: Player) -> void:
	_player.damage += damage
	queue_free()
	print("damage potion picked up")
