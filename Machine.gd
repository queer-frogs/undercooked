extends RigidBody2D
class_name Machine

var ellapsedtime : float = 0
var timer_on = false
@export var type : String
@export var necessaryTime: int
@export var over : bool
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
	ellapsedtime = 0
	$TimerLabel.text = ""
	if necessaryTime <= ellapsedtime and ellapsedtime <= (necessaryTime + 5)  or ellapsedtime > (necessaryTime + 5):

		if type == "chop":
			object.setup(object.chopResult, object.global_position, object.originBox)
		
		elif type == "boil":
			object.setup(object.boilResult, object.global_position, object.originBox)
		
		elif type == "wok":
			object.setup(object.wokResult, object.global_position, object.originBox)
		
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
			
		if ellapsedtime > necessaryTime + 5 :
			var red = Color(1.0,0.0,0.0,1.0)
			$TimerLabel.set("theme_override_colors/font_color",red)
			
		if necessaryTime <= ellapsedtime and ellapsedtime <= necessaryTime + 5 or ellapsedtime > necessaryTime and not over :
			var green = Color(0.0,1.0,0.0,1.0)
			$TimerLabel.set("theme_override_colors/font_color",green)
			
		object.global_position = global_position



func _input(_event):
	player = null
	if Input.is_action_just_pressed("interact_1"):
		if used :
			var bodies = $UseArea.get_overlapping_bodies()
			for body in bodies:
				if body.name == "Character1":
					player = body
			if player != null:
				if object.just_picked == true :
					object.playerPicker = player
					stop_use()
					used = false
		else :
			var bodies = $UseArea.get_overlapping_bodies()
			for body in bodies:
				if body.name == "Character1":
					player = body
			if player != null :
				var area = $UseArea.get_overlapping_areas()
				if area :
					object = area[0].get_parent()
					if object.just_dropped == true :
						object.visible = false
						used = true
						start_use()
						
	if Input.is_action_just_pressed("interact_2"):
		if used :
			var bodies = $UseArea.get_overlapping_bodies()
			for body in bodies:
				if body.name =="Character2":
					player = body
			if player != null:
				if object.just_picked == true :
					object.playerPicker = player
					stop_use()
					used = false
		else :
			var bodies = $UseArea.get_overlapping_bodies()
			for body in bodies:
				if body.name == "Character2":
					player = body
			if player != null :
				var area = $UseArea.get_overlapping_areas()
				if area :
					object = area[0].get_parent()
					if object.just_dropped == true :
						object.visible = false
						used = true
						start_use()
