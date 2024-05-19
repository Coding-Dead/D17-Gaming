class_name Garek
extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	print('Garek Tu')


func _on_chat_detection_area_body_exited(body):
	print("LEAVING CHAT")
	$chat_detection_area/Dialogue.leave()
	#if body.has_method("Player"):
		#print("In chat")


func _on_chat_detection_area_body_entered(body):
	print("ENTERING CHAT")
	
	$chat_detection_area/Dialogue.start()
	


func _on_dialogue_dialogue_finished():
	print('fin')
	
