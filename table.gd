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
	var arr = []
	for i in range(5):
		if i >= len(json):
			arr.append("")
		else:
			arr.append((str(i+1) + ". " + str(json[i]['user_name']) + " : " + str(json[i]['score'])))
		
	node1.text = arr[0]
	node2.text = arr[1]
	node3.text = arr[2]
	node4.text = arr[3]
	node5.text = arr[4]
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
