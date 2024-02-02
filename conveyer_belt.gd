extends RigidBody2D
class_name Conveyer
@onready var use_area = $UseArea

@onready var game_manager = $"../Game_manager"

var ellapsedtime : float = 0
var timer_on = false
@export var necessaryTime: int
var result : String
var used: bool = false
var player : CharacterBody2D = null
var object : RigidBody2D = null

func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(_event):
	player = null
	if Input.is_action_just_pressed("interact_1"):
		var bodies = use_area.get_overlapping_bodies()
		for body in bodies:
			if body.name == "Character1":
				player = body
		if player != null :
			var area = use_area.get_overlapping_areas()
			if area :
				object = area[0].get_parent()
				if object.just_dropped == true :
					var name_of_the_object = object.itemType 
					game_manager.add_repas(name_of_the_object)
					object.delete()


	if Input.is_action_just_pressed("interact_2"):
		var bodies = use_area.get_overlapping_bodies()
		for body in bodies:
			if body.name == "Character2":
				player = body
		if player != null :
			var area = use_area.get_overlapping_areas()
			if area :
				object = area[0].get_parent()
				if object.just_dropped == true :
					var name_of_the_object = object.itemType 
					game_manager.add_repas(name_of_the_object)
					object.delete()

