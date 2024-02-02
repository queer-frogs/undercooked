extends Node

var repas_faits = 0
var dishes_to_make = { "Tomato" : 2 , "eggplant" : 3, "banana" :2} 

func add_repas(name):
	print(name)
	if name in dishes_to_make and dishes_to_make[name] > 0 :
		dishes_to_make[name] -= 1
		print("nombre de " , name , " à faire : " , dishes_to_make[name])
		repas_faits +=1
		print("repas faits : " , repas_faits)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
