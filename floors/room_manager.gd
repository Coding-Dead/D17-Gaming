extends Area2D



func _on_body_entered(body):
	var floor_up = get_node("floors/SecondFloor")
	#var floor_up = get_node("../SecondFloor")
	print(floor_up)

	#print("entered")
	#print(body.name)
	#print(body.position)
	if(body.name=="Player"):
		#print(floor_up)
		#get_tree().change_scene_to_file("res://path_choice.tscn")
		Globals.next_player_position = Vector2(-350,-1460)
		body.position= Vector2(-350,-1460)
		#get_tree().change_scene_to_file("res://floors/second_floor.tscn")



func _on_aula_body_entered(body):
	if(body.name=="Player"):
		#print(floor_up)
		body.position= Vector2(-2000,0) # Replace with function body.
