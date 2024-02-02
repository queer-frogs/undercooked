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
	if Input.is_action_just_pressed("use"):
		var bodies = use_area.get_overlapping_bodies()
		print(bodies)
		for body in bodies:
			if body.name in ["Character1", "Character2"]:
				player = body
				print(player)
		if player != null and not player.can_pick:
			var area = use_area.get_overlapping_areas()
			print(area)
			if area :
				object = area[0].get_parent()
				game_manager.add_repas()
				print(object)
				object.delete()
				player.can_pick = true



