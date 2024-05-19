extends Control

signal dialogue_finished

@export_file("*.json") var d_file

var dialogue = []
var curr_dialogue_id = 0
var d_active = false

func _ready():
	$NinePatchRect.visible = false
	#start()

func leave():
	$NinePatchRect.visible = false
	
	
func start():
	print("started here")
	$NinePatchRect.visible = true
	if d_active:
		return
	d_active = true
	dialogue = load_dialogue()
	curr_dialogue_id = -1
	next_script()
	
func load_dialogue():
	var file = FileAccess.open("res://dialogue/garekDialogue.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func _input(event):
	if !d_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()
	
func next_script():
	curr_dialogue_id += 1
	if curr_dialogue_id >= len(dialogue):
		d_active = false
		$NinePatchRect.visible = false
		emit_signal("dialogue_finished")
		return
	
	$NinePatchRect/Name.text = dialogue[curr_dialogue_id]['name']
	$NinePatchRect/Text.text = dialogue[curr_dialogue_id]['text']
	$NinePatchRect/PageNumber.text = str(curr_dialogue_id + 1) + " / " + str(len(dialogue))
