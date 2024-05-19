class_name HealItem
extends Item

@export var hp : int = 100

func _init():
	item_name = "Health"
	type = ItemType.HEALTH
	sprite = load("res://assets/enemies/java.png")

func pick_up(_player : Player) -> void:
	print("heal item picked up")
	_player.curr_health += hp
	queue_free()
