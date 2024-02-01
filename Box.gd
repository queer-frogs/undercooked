extends RigidBody2D
class_name Box

var cooldown: float = 2.0
var cooling_down : bool = false
@export var ingredient_type : String = "apple"

# TODO add type

# Called when the node enters the scene tree for the first time.
func _enter_tree():
	cool_down()
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func cool_down():
	if cooling_down == false:
		cooling_down = true
		await get_tree().create_timer(2).timeout
		var ingredient_position = self.position
		ingredient_position[1] -= 50
		ingredient_position[0] += 50
		get_parent().spawn_ingredient(ingredient_type, ingredient_position, self)
		cooling_down = false
	

