extends Area2D 
class_name Item

const Player = preload("res://player.gd")

enum ItemType {HEALTH, SCORE, DAMAGE, SPEED}

var item_name : String = ""
var is_picked_up : bool = false;
var type: ItemType = ItemType.HEALTH;
var chance: float = 0.5;
var sprite = null;

func pick_up(_player: Player) -> void:
	queue_free()

