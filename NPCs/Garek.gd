class_name Garek
extends NPC

func _ready():
	pass

func _on_body_entered(body):
	print('Garek Tu')

func _on_chat_detection_area_body_exited(body):
	if is_instance_of(body, Player):
		print("LEAVING CHAT")
		$chat_detection_area/GarekDialogue.leave()

func _on_chat_detection_area_body_entered(body):
	if is_instance_of(body, Player):
		print("ENTERING CHAT")
		$chat_detection_area/GarekDialogue.start("res://dialogue/garek.json")

func _on_dialogue_dialogue_finished():
	print('fin')
