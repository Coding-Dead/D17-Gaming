extends Area2D

var speed = 1500
var damage = 10
var target_dir: Vector2
var time_since_start = 0
var time_to_live = 0.8
var targeted_group: String = "enemy"
var friendly_group: String = "player"

func _physics_process(delta):
	if target_dir:
		position += target_dir * speed * delta
	time_since_start += delta
	
	if time_since_start > time_to_live:
		queue_free()


func set_target(target_direction):
	target_dir = target_direction

func switch_target():
	targeted_group = "player"
	friendly_group = "enemy"


func _on_body_entered(body):
	if body.is_in_group(targeted_group):
		body.take_damage(damage)
	if not body.is_in_group(friendly_group):
		print(friendly_group)
		queue_free()
