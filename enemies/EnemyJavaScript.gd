class_name EnemyJavaScript
extends "EnemyInterface.gd"

@export var Bullet : PackedScene

func _init():
	speed = 10.0
	curr_health = 300
	attack_cooldown = 30
	damage = 60
	thorns_damage = 10
