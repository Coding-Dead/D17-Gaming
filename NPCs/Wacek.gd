class_name Wacek
extends NPC

func _on_body_entered(body):
	print('Wacek Tu')

func _on_chat_detection_area_body_exited(body):
	if is_instance_of(body, Player):
		print("LEAVING CHAT")
		$chat_detection_area/WacekDialogue.leave()

func _on_chat_detection_area_body_entered(body):
	if is_instance_of(body, Player):
		print("ENTERING CHAT")
		$chat_detection_area/WacekDialogue.start("res://dialogue/frydrych_quiz.json")

func _on_dialogue_dialogue_finished():
	print('fin')
