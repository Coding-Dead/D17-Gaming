class_name Falisz
extends NPC

func _ready():
	pass

func _on_body_entered(body):
	print('Falisz Tu')

func _on_chat_detection_area_body_exited(body):
	print("LEAVING CHAT")
	$chat_detection_area/Dialogue.leave()

func _on_chat_detection_area_body_entered(body):
	print("ENTERING CHAT")
	$chat_detection_area/Dialogue.start()

func _on_dialogue_dialogue_finished():
	print('fin')
