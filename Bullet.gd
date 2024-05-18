extends Area2D

var speed = 1500
var damage = 10
var target_dir: Vector2 = Vector2.ZERO
var time_since_start = 0
var time_to_live = 1.0

func _physics_process(delta):
	if target_dir:
		position += target_dir * speed * delta
	time_since_start += delta
	
	if time_since_start > time_to_live:
		queue_free()


func set_target(target_direction):
	target_dir = target_direction


func _on_body_entered(body):
	if body.is_in_group("enemy"):
		body.take_damage(damage)
	if not body.is_in_group("player"):
		queue_free()
