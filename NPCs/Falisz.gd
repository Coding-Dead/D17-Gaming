class_name Falisz
extends NPC

func _on_body_entered(body):
	print('Falisz Tu')

func _on_chat_detection_area_body_exited(body):
	if is_instance_of(body, Player):
		print("LEAVING CHAT")
		$chat_detection_area/FaliszDialogue.leave()

func _on_chat_detection_area_body_entered(body):
	if is_instance_of(body, Player):
		print("ENTERING CHAT")
		$chat_detection_area/FaliszDialogue.start("res://dialogue/falisz_quiz.json")

func _on_dialogue_dialogue_finished():
	print('fin')
