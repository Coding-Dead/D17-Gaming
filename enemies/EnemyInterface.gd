extends CharacterBody2D

@export var player : Node2D

var speed : float = 0.0

var in_attack_range : bool = false
var curr_health : float = 0.0
var attack_cooldown : float = 0
var curr_attack_cooldown : float = 0
var damage : float = 0
var is_ranged : bool = false
var touching_monster : bool = false
var random_direction : Vector2 = Vector2.ZERO
var touching_mobs = []




func attack_player(): # This has to be overriden in order to work for ranged enemies
	if curr_attack_cooldown == 0:
		player.take_damage(damage)
		curr_attack_cooldown = attack_cooldown
	else:
		curr_attack_cooldown -= 1


func _physics_process(delta):
	
	if player:
		if in_attack_range:
			attack_player()
		else:
			if touching_monster:
				position += random_direction * 1.5
			var direction = (player.position - position).normalized()
			position += direction * speed * delta


func take_damage(damage : float):
	print(curr_health)
	curr_health -= damage
	if curr_health <= 0:
		queue_free()


func sleep(seconds):
	await get_tree().create_timer(seconds).timeout 


func _on_attack_detection_area_body_entered(body):
	if body.is_in_group("player"):
		in_attack_range = true


func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):
		player = body


func _on_attack_detection_area_body_exited(body):
	if body.is_in_group("player"):
		in_attack_range = false
