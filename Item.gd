extends RigidBody2D
class_name Item

var picked : bool = false
var just_dropped : bool = false
var playerPicker : CharacterBody2D = null
var a  	# way the vector goes, 1 right or -1 left
var dish : bool = true
var just_picked : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Picking processing
	if picked == true:

		self.position = playerPicker.get_node("PickUpMarker").global_position
		if just_picked == true:
			just_picked = false

	elif just_dropped:
		if randi() % 2 == 0:
			a = 1
		else:
			a = -1
		apply_impulse(Vector2(), Vector2(400 * a,-400))
		self.linear_velocity = Vector2(0,0)
		self.position[1] -= 15
		self.position[0] -= 15 * a
		just_dropped = false		

		
func _input(_event):
	# Interaction processing
	if Input.is_action_just_pressed("interact"):
		if picked:
			# drop
			picked = false

			playerPicker.can_pick = true
			playerPicker = null
			just_dropped = true
		else:
			# pick
			var bodies = $PickArea.get_overlapping_bodies()
			for body in bodies:
				if body.name in ["Character1", "Character2"]:
					playerPicker= body
			if playerPicker != null and playerPicker.can_pick:
				picked = true
				playerPicker.can_pick = false
				just_picked = true
			else:
				playerPicker = null
	
	# Dash / throw item
	if Input.is_action_just_pressed("dash_1"):
		if picked == true:
			if playerPicker.name == "Character1":
				a = 1
				if playerPicker.facing_left == true :
					a= -1
				picked = false
				playerPicker = null
				self.linear_velocity = Vector2(0,0)
				apply_central_impulse(Vector2(1000*a,-600))
				self.position[1] -= 15
				self.position[0] -= 15 
		
	if Input.is_action_just_pressed("dash_2"):
		if picked == true:
			if playerPicker.name == "Character2":
				a = 1
				if playerPicker.facing_left == true :
					a= -1
				picked = false
				playerPicker = null
				self.linear_velocity = Vector2(0,0)
				apply_central_impulse(Vector2(1000*a,-600))
				self.position[1] -= 15
				self.position[0] -= 15 
func delete():
	queue_free()
