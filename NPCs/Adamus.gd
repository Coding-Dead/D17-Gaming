class_name Adamus
extends NPC

func _on_body_entered(body):
	print('Adamus Tu')

func _on_chat_detection_area_body_exited(body):
	if is_instance_of(body, Player):
		print("LEAVING CHAT")
		$chat_detection_area/AdamusDialogue.leave()

func _on_chat_detection_area_body_entered(body):
	if is_instance_of(body, Player):
		print("ENTERING CHAT")
		$chat_detection_area/AdamusDialogue.start("res://dialogue/adamus_quiz.json")

func _on_dialogue_dialogue_finished():
	print('fin')
