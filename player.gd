extends CharacterBody2D

@export var speed = 400
@export var dash_speed = 800
@export var dash_duration = 0.2
@export var dash_cooldown = 0.5
@export var Bullet : PackedScene 

@onready var debug_label = $DebugLabel

var curr_health: float = 100.0
var is_dashing = false
var dash_time_left = 0
var dash_cooldown_left = 0
var last_input_direction = Vector2.ZERO
var projectile_amount = 1
var spread_angle = 1
var damage = 10.0

func shoot():
	for i in range(projectile_amount):
		var bullet = Bullet.instantiate()
		bullet.damage = damage  
		add_child(bullet)
		var angle_offset = spread_angle * (i - (projectile_amount - 1) / 2.0)
		var direction = position.direction_to(get_global_mouse_position()).rotated(deg_to_rad(angle_offset))
		bullet.set_target(direction)
	
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
	if not is_dashing:
		velocity = input_direction * speed
		if input_direction != Vector2.ZERO:
			last_input_direction = input_direction
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_just_pressed("dash") and dash_cooldown_left <= 0:
		start_dash()

func _physics_process(delta):
	debug_label.text = "Health: %d\nScore: %d" % [curr_health, 0]
	get_input()
	if is_dashing:
		update_dash(delta)
	if dash_cooldown_left > 0:
		dash_cooldown_left -= delta
	move_and_slide()

func take_damage(damage: float):
	curr_health -= damage
	if curr_health < 0:
		print("nie zyje")
