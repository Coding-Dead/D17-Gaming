class_name ScoreItem
extends Item

@export var score : int = 1

func _init():
	item_name = "Score Potion"
	type = ItemType.SCORE

func pick_up(_player: Player, number_of_picked: int) -> void:
	_player.score += score_to_add(number_of_picked)
	queue_free()
	print("score item picked up: ", number_of_picked)

func score_to_add(number_of_picked: int) -> int:
	return score
