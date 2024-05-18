extends CharacterBody2D

@export var speed = 400
@export var dash_speed = 800
@export var dash_duration = 0.2
@export var dash_cooldown = 0.5 # Cooldown time in seconds
@export var Bullet : PackedScene 

var is_dashing = false
var dash_time_left = 0
var dash_cooldown_left = 0
var last_input_direction = Vector2.ZERO

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
	
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
	look_at(get_global_mouse_position())
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
	get_input()
	if is_dashing:
		update_dash(delta)
	if dash_cooldown_left > 0:
		dash_cooldown_left -= delta
	move_and_slide()

