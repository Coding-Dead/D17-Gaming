extends Control

@export var node1: Node
@export var node2: Node
@export var node3: Node
@export var node4: Node
@export var node5: Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)
	$HTTPRequest.request("http://localhost:3000/scores")

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	node1.text = ("1. " + str(json[0]['user_name']) + " : " + str(json[0]['score']))
	node2.text = ("2. " + str(json[1]['user_name']) + " : " + str(json[1]['score']))
	node3.text = ("3. " + str(json[2]['user_name']) + " : " + str(json[2]['score']))
	node4.text = ("4. " + str(json[3]['user_name']) + " : " + str(json[3]['score']))
	node5.text = ("5. " + str(json[4]['user_name']) + " : " + str(json[4]['score']))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
