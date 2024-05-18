class_name EnemyC
extends "EnemyInterface.gd"

func _init():
	curr_health = 120.0
	speed = 75.0
	attack_cooldown = 150.0
	damage = 20.0
	is_ranged = true


func attack_player():
	if curr_attack_cooldown == 0:
		var spread_angle = 30
		
		for i in range(12):
			var bullet = Bullet.instantiate() 
			bullet.damage = damage
			bullet.speed = 400.0 
			bullet.switch_target()
			add_child(bullet)

			var angle_offset = spread_angle * (i - 1)
			var direction = position.direction_to(player.position).rotated(deg_to_rad(angle_offset))
			
			bullet.set_target(direction)
		curr_attack_cooldown = attack_cooldown
	else:
		curr_attack_cooldown -= 1
