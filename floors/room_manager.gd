extends Area2D

var cords ={
	"Aula": Vector2(-5500,0),
	"Aula1": Vector2(9400,-5000),
	"Floor2": Vector2(0,-2530),
	"Floor3": Vector2(0,5500),
	"WC": Vector2(0,2880),
	"kapi":Vector2(-6000,2560),
	"shanon1":Vector2(-6300,-6400),
	"room3": Vector2(5120,-2500),
	"boss":Vector2(-6400,6400)
	
	}

var rooms_entered=[3,4,4,4]
var current_floor=0


func _on_first_elevator_entered(body):
	if(rooms_entered[0]<=0):
		if(body.name=="Player"):
			body.position= cords["Floor2"]
		

func _on_aula_body_entered(body):
	if(body.name=="Player"):
		body.position= cords["Aula"]
		rooms_entered[0]-=1


func _on_first_WC_entered(body):
	if(body.name=="Player"):
		body.position= cords["WC"]
		rooms_entered[0]-=1



func _on_first_stolowka_body_entered(body):
	pass
	#if(body.name=="Player"):
		#body.position= cords["room"]
		#rooms_entered[0]-=1


func _on_first_shanon_body_entered(body):
	if(body.name=="Player"):
		body.position= cords["shanon1"]
		rooms_entered[0]-=1
