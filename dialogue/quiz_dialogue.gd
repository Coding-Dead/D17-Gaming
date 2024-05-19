extends Control

signal dialogue_finished

@export_file("*.json") var d_file

var dialogue = []
var curr_dialogue_id = -1
var d_active = false
var asked_question = false

func _ready():
	curr_dialogue_id = -1
	$NinePatchRect.visible = false
	#start()
	
func leave():
	curr_dialogue_id = -1
	asked_question = false
	next_script()
	$NinePatchRect.visible = false
	
func start(path):
	print("started here")
	dialogue = load_dialogue(path)
	$NinePatchRect.visible = true
	asked_question = false
	curr_dialogue_id = -1
	if d_active:
		next_script()
		return
	d_active = true
	next_script()
	
func load_dialogue(path):
	curr_dialogue_id = -1
	print("json")
	var file = FileAccess.open(path, FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func _input(event):
	if !d_active:
		return

	if asked_question:
		if event is InputEventKey and event.pressed:
			$NinePatchRect/BadAnswer.text = ""
			if event.keycode-49<4 and event.keycode - 49 == dialogue[curr_dialogue_id]["correct_answer"]:
				asked_question = false
				next_script()
			else:
				$NinePatchRect/BadAnswer.text = "\nBad answer"
		
	elif event.is_action_pressed("ui_accept"):
		next_script()
	
	
func next_script():
	curr_dialogue_id += 1
	if curr_dialogue_id >= len(dialogue):
		d_active = false
		$NinePatchRect.visible = false
		emit_signal("dialogue_finished")
		return
		
	$NinePatchRect/Name.text = dialogue[curr_dialogue_id]['name']
	
	if dialogue[curr_dialogue_id].has('question'):
		asked_question = true
		var text_to_display = dialogue[curr_dialogue_id]['question']
		var i = 0
		for ans in dialogue[curr_dialogue_id]['answers']:
			text_to_display += "\n"+str(i+1) + ": " +ans
			i += 1
		$NinePatchRect/Text.text = text_to_display
	else:
		$NinePatchRect/Text.text = dialogue[curr_dialogue_id]['text']
		
	$NinePatchRect/PageNumber.text = str(curr_dialogue_id + 1) + " / " + str(len(dialogue))



func _on_dialogue_finished():
	curr_dialogue_id = -1

func _on_chat_detection_area_body_entered(body):
	curr_dialogue_id = -1


