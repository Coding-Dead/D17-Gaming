class_name EnemyJavaScript
extends "EnemyInterface.gd"

func _init():
	curr_health = 100.0
	speed = 100.0
	attack_cooldown = 30.0
	damage = 50.0


func _on_attack_detection_area_body_entered(body):
	if body.is_in_group("player"):
		in_attack_range = true


func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):
		player = body


func _on_detection_area_body_exited(body):
	if body.is_in_group("player"):
		in_attack_range = false
