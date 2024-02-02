extends Item
class_name Ingredient

var wokResult: String = "coal"
var boilResult: String = "coal"
var chopResult: String = "coal"
var itemType: String = "coal"
var originBox: Box = null
var regenerated: bool = false

func setup(type: String, init_position: Vector2, box: Box):
	position = init_position
	originBox = box
	dish = false
	itemType = type

	wokResult = "coal"
	boilResult = "coal"
	chopResult = "coal"
	
	# Ingredients
	if itemType == "Zucchini":
		$Sprite.play("zucchini")
		chopResult = "choppedZucchini"
	elif itemType == "Tomato":
		$Sprite.play("tomato")
		chopResult = "choppedTomato"
	elif itemType == "Noodles":
		$Sprite.play("noodles")
		boilResult = "boiledNoodles"
	elif itemType == "coal":
		$Sprite.play("coal")
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
		wokResult = "cookedEggplant"

	elif itemType == "choppedZucchini":
		$Sprite.play("choppedZucchini")
		chopResult = "choppedZucchini"
		wokResult = "cookedZucchini"
	# Dishes
	elif itemType == "plate":
		dish = true
		$Sprite.play("apple")

	else:
		printerr("Error : the type provided is not supported.")
	
func _process(_delta):
	if originBox != null and just_picked and not regenerated:
		originBox.cool_down()
		regenerated = true
	super._process(_delta)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



