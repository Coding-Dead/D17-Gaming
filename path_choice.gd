extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://sandbox_SCZZCZ.tscn")
	var player = get_tree().get_nodes_in_group("player")[0]
	player.position = Globals.next_player_position
	#Player.position = Globals.last_player_position
