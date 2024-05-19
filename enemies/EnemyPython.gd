class_name EnemyPython
extends "EnemyInterface.gd"

func _init():
	curr_health = 75.0
	speed = 30.0
	attack_cooldown = 400.0
	damage = 30.0
	is_ranged = true
	charging_movement = true


func attack_player():
	if curr_attack_cooldown == 0:
		var spread_angle = 5
		
		for i in range(10):
			var bullet = Bullet.instantiate() 
			bullet.damage = damage
			bullet.speed = 500.0
			bullet.time_to_live = 3.0
			bullet.switch_target()
			add_child(bullet)

			var angle_offset = spread_angle * (i - 1)
			var direction = position.direction_to(player.position).rotated(deg_to_rad(angle_offset))
			
			bullet.set_target(direction)
		curr_attack_cooldown = attack_cooldown
	else:
		curr_attack_cooldown -= 1
