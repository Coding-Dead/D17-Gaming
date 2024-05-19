class_name Fortuna
extends NPC

func _ready():
	position = Vector2(300,200)

func _on_body_entered(body):
	print('Fortuna Tu')

func _on_chat_detection_area_body_exited(body):
	print("LEAVING CHAT")
	$chat_detection_area/Dialogue.leave()

func _on_chat_detection_area_body_entered(body):
	print("ENTERING CHAT")
	$chat_detection_area/Dialogue.start()

func _on_dialogue_dialogue_finished():
	print('fin')


func _on_area_2d_body_entered(body):
	pass # Replace with function body.
