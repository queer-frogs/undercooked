extends Item
class_name Ingredient

var wokResult: String = "none"
var boilResult: String = "none"
var chopResult: String = "none"
var itemType: String = "none"
var originBox: Box = null
var regenerated: bool = false

func setup(type: String, init_position: Vector2, box: Box):
	position = init_position
	originBox = box
	dish = false
	itemType = type
	if itemType == "Zucchini":
		$Sprite.play("zucchini")
		chopResult = "choppedZucchini"
	elif itemType == "Tomato":
		$Sprite.play("tomato")
		chopResult = "choppedTomato"
	elif itemType == "Noodles":
		$Sprite.play("noodles")
		wokResult = "boiledNoodles"
	elif itemType == "coal":
		$Sprite.play("coal")
		chopResult = "coal"
	elif itemType == "Eggplant":
		$Sprite.play("eggplant")
		chopResult = "choppedEggplant"
	elif itemType == "Carrot":
		$Sprite.play("carrot")
		chopResult = "choppedCarrot"
	elif itemType == "choppedTomato":
		$Sprite.play("choppedTomato")
		chopResult = "choppedTomato"
		wokResult = "cookedTomato"
	elif itemType == "choppedCarrot":
		$Sprite.play("choppedCarrot")
		chopResult = "choppedCarrot"
		wokResult = "cookedCarrot"
	elif itemType == "choppedEggplant":
		$Sprite.play("choppedEggplant")
		chopResult = "choppedEggplant"
		wokResult = "choppedEggplant"
	elif itemType == "choppedZucchini":
		$Sprite.play("choppedZucchini")
		chopResult = "choppedZucchini"
		wokResult = "choppedZucchini"
	else:
		printerr("Error : the type provided is not supported.")
	
func _process(_delta):
	if just_picked and not regenerated:
		originBox.cool_down()
		regenerated = true
	super._process(_delta)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



