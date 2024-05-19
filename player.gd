extends CharacterBody2D

@export var speed = 400
@export var dash_speed = 800
@export var dash_duration = 0.2
@export var dash_cooldown = 0.5
@export var Bullet : PackedScene 
@export var health : int = 1000
@export var score : int = 0

@onready var debug_label = $DebugLabel

const Item = preload("res://items/Item.gd")

var curr_health: float = 100.0
var is_dashing = false
var dash_time_left = 0
var dash_cooldown_left = 0
var last_input_direction = Vector2.ZERO
var projectile_amount = 1
var spread_angle = 1
var damage = 10.0

var picked_items  = {
	Item.ItemType.HEALTH: 0,
	Item.ItemType.SCORE: 0,
	Item.ItemType.DAMAGE: 0,
	Item.ItemType.SPEED: 0
}

func shoot():
	for i in range(projectile_amount):
		var bullet = Bullet.instantiate()
		bullet.damage = damage  
		add_child(bullet)
		var angle_offset = spread_angle * (i - (projectile_amount - 1) / 2.0)
		var direction = position.direction_to(get_global_mouse_position()).rotated(deg_to_rad(angle_offset))
		bullet.set_target(direction)
		
		var x = get_global_mouse_position() - position
		bullet.rotate(x.angle())
	
func start_dash():
	if last_input_direction != Vector2.ZERO:
		is_dashing = true
		dash_time_left = dash_duration
		dash_cooldown_left = dash_cooldown
		velocity = last_input_direction.normalized() * dash_speed

func update_dash(delta):
	dash_time_left -= delta
	if dash_time_left <= 0:
		is_dashing = false

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")

	var dict = {
		Vector2(1, 0): "walk_right",
		Vector2(0, 1): "walk_down",
		Vector2(-1, 0): "walk_left",
		Vector2(0, -1): "walk_up",
		Vector2(0, 0): "idle"
	}

	match input_direction:
		Vector2(1, 0):
			$AnimatedSprite2D2.flip_h = true
			$AnimatedSprite2D2.play(dict[Vector2(1, 0)])
		Vector2(0, 1):
			$AnimatedSprite2D2.play(dict[Vector2(0, 1)])
		Vector2(-1, 0):
			$AnimatedSprite2D2.flip_h = false
			$AnimatedSprite2D2.play(dict[Vector2(-1, 0)])
		Vector2(0, -1):
			$AnimatedSprite2D2.play(dict[Vector2(0, -1)])
		Vector2(0, 0):
			$AnimatedSprite2D2.play("idle")
		_:
			pass

	
	
	
	
	
	if not is_dashing:
		velocity = input_direction * speed
		if input_direction != Vector2.ZERO:
			last_input_direction = input_direction
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_just_pressed("dash") and dash_cooldown_left <= 0:
		start_dash()


func _physics_process(delta):
	debug_label.text = "Health: %d\nScore: %d" % [curr_health, score]
	get_input()
	if is_dashing:
		update_dash(delta)
	if dash_cooldown_left > 0:
		dash_cooldown_left -= delta
	move_and_slide()


func take_damage(_damage: float):
	curr_health -= _damage
	if curr_health < 0:
		#print("nie zyje")
		return


func _on_area_2d_area_entered(area: Area2D):
	if is_instance_of(area, Item):
		picked_items[area.type] += 1
		area.pick_up(self, picked_items[area.type])
		print("score: ", score, " health: ", curr_health, " dmg: ", damage, " speed: ", speed)
