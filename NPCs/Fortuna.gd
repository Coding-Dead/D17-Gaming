class_name Fortuna
extends NPC

func _on_body_entered(body):
	print('Fortuna Tu')

func _on_chat_detection_area_body_exited(body):
	if is_instance_of(body, Player):
		print("LEAVING CHAT")
		$chat_detection_area/FortunaDialogue.leave()

func _on_chat_detection_area_body_entered(body):
	if is_instance_of(body, Player):
		print("ENTERING CHAT")
		$chat_detection_area/FortunaDialogue.start("res://dialogue/fortuna.json")

func _on_dialogue_dialogue_finished():
	print('fin')


func _on_area_2d_body_entered(body):
	pass # Replace with function body.
