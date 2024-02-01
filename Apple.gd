extends RigidBody2D
class_name LightProp

var picked : bool = false
var just_dropped : bool = false
var player : CharacterBody2D = null
var a  	# way the vector goes, 1 right or -1 left

func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if picked == true:
		self.position = player.get_node("PickUpMarker").global_position
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
		#$CollisionShape2D.disabled = false
		#$PickArea/CollisionShape2D.disabled = false
		
func _input(_event):
	if Input.is_action_just_pressed("interact"):
		if picked:
			# drop
			picked = false
			player = null
			just_dropped = true
		else:
			# pick
			var bodies = $PickArea.get_overlapping_bodies()
			for body in bodies:
				if body.name in ["Character1", "Character2"]:
					player = body
			if player != null and player.can_pick:
				picked = true
				#$CollisionShape2D.disabled = true
				#$PickArea/CollisionShape2D.disabled = true
				
