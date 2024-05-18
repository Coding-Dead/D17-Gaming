class_name EnemySQL
extends "EnemyInterface.gd"

func _init():
	curr_health = 100.0
	speed = 100.0
	attack_cooldown = 50.0
	damage = 10.0
	is_ranged = true


func attack_player():
	if curr_attack_cooldown == 0:
		var spread_angle = 30
		
		for i in range(3):
			var bullet = Bullet.instantiate() 
			bullet.damage = damage
			bullet.speed = 1000.0 
			bullet.switch_target()
			add_child(bullet)

			var angle_offset = spread_angle * (i - 1)
			var direction = position.direction_to(player.position).rotated(deg_to_rad(angle_offset))
			
			bullet.set_target(direction)
		curr_attack_cooldown = attack_cooldown
	else:
		curr_attack_cooldown -= 1
