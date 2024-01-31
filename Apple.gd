extends RigidBody2D

var picked = false
var player = null
var just_dropped = false
var a = 1 	# way the vector goes, 1 or -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if picked == true:
		self.position = get_node("../CharacterBody2D/PickUpMarker").global_position
	elif just_dropped:
		$CollisionShape2D.disabled = false
		$PickArea/CollisionShape2D.disabled = false
		if randi() % 2 == 0:
			a = 1
		else:
			a = -1
		apply_central_impulse(Vector2(100 * a,0))
		just_dropped = false		
		
func _input(event):
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
				if body.name == "CharacterBody2D":
					player = body
			if player != null and player.can_pick:
				picked = true
				$CollisionShape2D.disabled = true
				$PickArea/CollisionShape2D.disabled = true
				
