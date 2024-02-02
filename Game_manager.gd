extends Node

var repas_faits = 0
var dishes_to_make = { "Tomato" : 2 , "Eggplant" : 3, "Zucchini" :2} 
@onready var label = $"../conveyer_belt/UI/Panel/Label"
var text=""
var victory=0

func add_repas(name):
	print(name)
	if name in dishes_to_make and dishes_to_make[name] > 0 :
		dishes_to_make[name] -= 1
		var text=""
		for plate in dishes_to_make:
			text+= str("nombre de " , plate , " à faire : " , dishes_to_make[plate], "    |   ")
		label.text=text
		print("nombre de " , name , " à faire : " , dishes_to_make[name])
		repas_faits +=1
		print("repas faits : " , repas_faits)


# Called when the node enters the scene tree for the first time.
func _ready():
	for plate in dishes_to_make:
		text+= str("nombre de " , plate , " à faire : " , dishes_to_make[plate], "    |   ")
		label.text=text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	victory = 1
	for plate in dishes_to_make:
		if dishes_to_make[plate] != 0 :
			victory = 0
	if victory == 1 :
		print("victoire")
