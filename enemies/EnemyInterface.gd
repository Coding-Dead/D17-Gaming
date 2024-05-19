extends CharacterBody2D

@export var Bullet : PackedScene
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

const HealItem = preload("res://items/HealItem.tscn")
const ScoreItem = preload("res://items/ScoreItem.tscn")

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
			var direction = (player.global_position - global_position).normalized()
			velocity += direction * speed / 20
			move_and_slide()

func sleep(seconds):
	await get_tree().create_timer(seconds).timeout 


func _on_attack_detection_area_body_entered(body):
	if body.is_in_group("player"):
		in_attack_range = true


func _on_detection_area_body_entered(body):
	if body.is_in_group("player") and not player:
		print("FOUND PLAYER!")
		player = body


func _on_attack_detection_area_body_exited(body):
	if body.is_in_group("player"):
		in_attack_range = false


func take_damage(_damage : float):
	curr_health -= _damage
	if curr_health <= 0:
		generate(position, 3)
		queue_free()


func generate(position: Vector2, no_items: int):
	var delta : float = 50.0
	for i in range(no_items):
		var delta_x : float = float(randi_range(-delta, delta))
		var delta_y : float = float(randi_range(-delta, delta))
		var j = randi() % 2
		var item = null;
		if j == 0:
			item = ScoreItem.instantiate()
		else:
			item = HealItem.instantiate()
		item.position = Vector2(position.x+delta_x, position.y+delta_y)
		call_deferred("add_item", item)

func add_item(item):
	get_parent().add_child(item)


