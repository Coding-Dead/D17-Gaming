class_name Wacek
extends NPC

func _ready():
	position = Vector2(0,300)

func _on_body_entered(body):
	print('Wacek Tu')

func _on_chat_detection_area_body_exited(body):
	print("LEAVING CHAT")
	$chat_detection_area/WacekDialogue.leave()

func _on_chat_detection_area_body_entered(body):
	print("ENTERING CHAT")
	$chat_detection_area/WacekDialogue.start("res://dialogue/garek.json")

func _on_dialogue_dialogue_finished():
	print('fin')
