class_name SpeedPotion
extends Item

@export var speed : int = 200

func _init():
	item_name = "Speed Potion"
	type = ItemType.SPEED

func pick_up(_player: Player) -> void:
	_player.speed += speed
	queue_free()
	print("speed potion picked up")
