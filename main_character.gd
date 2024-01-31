extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -600.0
const jump_max = 2
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var jump_restant = jump_max


	
func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	var juste_saute = 0
	if (velocity.x < -1 || velocity.x > 1 ) :
		sprite_2d.animation = "run"
	else :
		sprite_2d.animation = "default"
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
		
	if jump_restant != jump_max and (is_on_floor() or is_on_wall()) :
		jump_restant = jump_max

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (jump_restant > 0) :
		if is_on_wall() and not is_on_floor():
			sprite_2d.animation = "wall_jump"
			velocity.y = JUMP_VELOCITY
			velocity.x = direction * -SPEED*10 
			jump_restant-=1
		else :
			sprite_2d.animation = "jump"
			velocity.y = JUMP_VELOCITY
			jump_restant-=1
		juste_saute = 1

	
	
	if direction and juste_saute == 0 :
		velocity.x = direction * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, 30)

	move_and_slide()
	
	var IsLeft = velocity.x < 0
	sprite_2d.flip_h = IsLeft
	
	
