class_name EnemyPi
extends "EnemyInterface.gd"

func _init():
	curr_health = 80.0
	speed = 150.0
	attack_cooldown = 40.0
	damage = 10.0
	charging_movement = true
