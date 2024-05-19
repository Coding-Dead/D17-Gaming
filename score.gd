extends Control

@export var lineEdit: LineEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	print(lineEdit.text)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		var file = FileAccess.open("res://global.txt", FileAccess.READ)
		var content = file.get_as_text()
		var url = "http://localhost:3000/scores"
		var data_to_send = {
			"name": lineEdit.text,
			"score": content
		}
		var json = JSON.stringify(data_to_send)
		var headers = ["Content-Type: application/json"]
		$HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, json)
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://table.tscn")
	pass
