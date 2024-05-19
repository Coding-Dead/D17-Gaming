class_name Zygmunt
extends NPC

func _ready():
	position = Vector2(300,600)

func _on_body_entered(body):
	print('Zygmunt Tu')

func _on_chat_detection_area_body_exited(body):
	print("LEAVING CHAT")
	$chat_detection_area/Dialogue.leave()

func _on_chat_detection_area_body_entered(body):
	print("ENTERING CHAT")
	$chat_detection_area/Dialogue.start("res://dialogue/garek.json")

func _on_dialogue_dialogue_finished():
	print('fin')


func _on_chat_detection_area_area_entered(area):
	pass # Replace with function body.
