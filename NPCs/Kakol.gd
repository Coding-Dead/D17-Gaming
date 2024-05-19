class_name Kakol
extends NPC

func _ready():
	position = Vector2(400,100)

func _on_body_entered(body):
	print('Kakol Tu')

func _on_chat_detection_area_body_exited(body):
	if is_instance_of(body, Player):
		print("LEAVING CHAT")
		$chat_detection_area/KakolDialogue.leave()

func _on_chat_detection_area_body_entered(body):
	if is_instance_of(body, Player):
		print("ENTERING CHAT")
		$chat_detection_area/KakolDialogue.start("res://dialogue/garek.json")

func _on_dialogue_dialogue_finished():
	print('fin')
