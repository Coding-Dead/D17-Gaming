class_name GarekFinish
extends NPC


func _on_body_entered(body):
	print('Garek Finish Tu')

func _on_chat_detection_area_body_exited(body):
	if is_instance_of(body, Player):
		print("LEAVING CHAT")
		$chat_detection_area/GarekFinishDialogue.leave()

func _on_chat_detection_area_body_entered(body):
	if is_instance_of(body, Player):
		print("ENTERING CHAT")
		$chat_detection_area/GarekFinishDialogue.start("res://dialogue/garek.json")

func _on_dialogue_dialogue_finished():
	print('fin')


func _on_garek_finish_dialogue_dialogue_finished():
	pass # Replace with function body.
