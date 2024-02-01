extends Item
class_name Ingredient

var wokResult: String = "none"
var boilResult: String = "none"
var chopResult: String = "none"
var itemType: String = "none"


func setup(type: String, init_position: Vector2):
	position = init_position
	dish = false
	itemType = type
	if itemType == "apple":
		$Sprite.play("apple")
		chopResult = "choppedApple"
	elif itemType == "banana":
		$Sprite.play("banana")
		chopResult = "choppedBanana"
	else:
		printerr("Error : the type provided is not supported.")

	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

