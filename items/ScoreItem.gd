class_name ScoreItem
extends Item

@export var score : int = 1

func _init():
	item_name = "Score"
	type = ItemType.SCORE
	sprite = load("res://assets/enemies/github.png")

func pick_up(_player: Player) -> void:
	_player.score += score
	queue_free()
	print("score item picked up")

