extends RigidBody2D
class_name Machine

var ellapsedtime : float = 0
var timer_on = false
@export var type : String
@export var necessaryTime: int
var used: bool = false
var player : CharacterBody2D = null
var object : RigidBody2D = null

func _init():
	pass
	
func setup():
	if type == "chop":
		$Sprite.play("chop")
	elif type == "wok":
		$Sprite.play("wok")
	elif type == "boil":
		$Sprite.play("boil")

func start_use():
	timer_on = true
	
func stop_use():
	timer_on = false
	if necessaryTime <= ellapsedtime and ellapsedtime <= (necessaryTime + 5) :
		$TimerLabel.text = ""
		ellapsedtime = 0
		
		if type == "chop":
			object.setup(object.chopResult, object.global_position, object.originBox)
		
		elif type == "boil":
			object.setup(object.boilResult, object.global_position, object.originBox)
		
		elif type == "cook":
			object.setup(object.cookResult, object.global_position, object.originBox)
		
		
	elif ellapsedtime > (necessaryTime + 5) :
		$TimerLabel.text = ""
		ellapsedtime = 0
		object.setup("coal", object.global_position, object.originBox)
		
	object.visible = true
	var white = Color(1.0,1.0,1.0,1.0)
	$TimerLabel.set("theme_override_colors/font_color",white)
		


# Called when the node enters the scene tree for the first time.
func _ready():
	setup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if timer_on:
		ellapsedtime += _delta
		var text = str(snapped(ellapsedtime, 1))
		$TimerLabel.text = text
		
		if necessaryTime <= ellapsedtime and ellapsedtime <= necessaryTime + 5 :
			var green = Color(0.0,1.0,0.0,1.0)
			$TimerLabel.set("theme_override_colors/font_color",green)
			
		if ellapsedtime > necessaryTime + 5 :
			var red = Color(1.0,0.0,0.0,1.0)
			$TimerLabel.set("theme_override_colors/font_color",red)



func _input(_event):
	player = null
	if Input.is_action_just_pressed("use"):
		if used :
			var bodies = $UseArea.get_overlapping_bodies()
			for body in bodies:
				if body.name in ["Character1", "Character2"]:
					player = body
			if player != null and player.can_pick:
				object.playerPicker = player
				object.picked = true
				object.just_dropped = false
				player.can_pick = false
				stop_use()
				used = false
		else :
			var bodies = $UseArea.get_overlapping_bodies()
			for body in bodies:
				if body.name in ["Character1", "Character2"]:
					player = body
			if player != null and not player.can_pick:
				used = true
				var area = $UseArea.get_overlapping_areas()
				if area :
					object = area[0].get_parent()
					object.visible = false
					object.picked = false
					object.just_dropped = true
					player.can_pick = true
					start_use()
				


func _on_timer_timeout():
	pass # Replace with function body.
