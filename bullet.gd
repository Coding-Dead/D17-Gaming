extends Area2D

var speed = 1500

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	queue_free()