extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if(body.name=="Player"):
		#print(floor_up)
		body.position= Vector2(-382, -3164)
	


func _on_room_21_body_entered(body):
	if(body.name=="Player"):
		body.position= Vector2(-5750, -2700)


func _on_area_2d_4_body_entered(body):
	if(body.name=="Player"):
		body.position= Vector2(4000, 3300)


func _on_area_2d_3_body_entered(body):
	if(body.name=="Player"):
		body.position= Vector2(9500, -4900)


func _on_area_2d_2_body_entered(body):
	if(body.name=="Player"):
		body.position= Vector2(4950, -2550)
