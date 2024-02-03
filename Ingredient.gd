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
		$Sprite.play("Zucchini")
		$Sprite.scale = Vector2(1.3, 1.3)
		chopResult = "choppedZucchini"
	elif itemType == "Tomato":
		$Sprite.play("Tomato")
		chopResult = "choppedTomato"
	elif itemType == "Noodles":
		$Sprite.play("Noodles")
		$Sprite.scale = Vector2(1.2, 1.2)
		boilResult = "boiledNoodles"
	elif itemType == "boiledNoodles":
		$Sprite.play("boiledNoodles")
		$Sprite.scale = Vector2(1.3, 1.3)
	elif itemType == "coal":
		$Sprite.play("coal")
		$Sprite.scale = Vector2(1.3, 1.3)
	elif itemType == "Eggplant":
		$Sprite.play("Eggplant")
		$Sprite.scale = Vector2(0.7, 0.7)
		chopResult = "choppedEggplant"
	elif itemType == "Carrot":
		$Sprite.play("Carrot")
		$Sprite.scale = Vector2(2.7, 2.7)
		chopResult = "choppedCarrot"
	elif itemType == "choppedTomato":
		$Sprite.play("choppedTomato")
		$Sprite.scale = Vector2(1.3, 1.3)
		chopResult = "choppedTomato"
		wokResult = "cookedTomato"
	elif itemType == "choppedCarrot":
		$Sprite.play("choppedCarrot")
		$Sprite.scale = Vector2(1.3, 1.3)
		chopResult = "choppedCarrot"
		wokResult = "cookedCarrot"
	elif itemType == "choppedEggplant":
		$Sprite.play("choppedEggplant")
		$Sprite.scale = Vector2(1.3, 1.3)
		chopResult = "choppedEggplant"
		wokResult = "cookedEggplant"
	elif itemType == "choppedZucchini":
		$Sprite.play("choppedZucchini")
		$Sprite.scale = Vector2(1.3, 1.3)
		chopResult = "choppedZucchini"
		wokResult = "cookedZucchini"
		
	elif itemType == "cookedZucchini":
		$Sprite.play("cookedZucchini")
	elif itemType == "cookedCarrot":
		$Sprite.play("cookedCarrot")
	elif itemType == "cookedTomato":
		$Sprite.play("cookedTomato")
	elif itemType == "cookedEggplant":
		$Sprite.play("cookedEggplant")
		
	elif itemType == "Moussaka":
		$Sprite.play("Moussaka")
		dish = true
		boilResult = "MousseMacabre"
		wokResult = "MousseMacabre"
	elif itemType == "MousseMacabre":
		dish = true
		$Sprite.play("MousseMacabre")
	elif itemType == "Tomato-Carrot Noodles":
		dish = true
		$Sprite.play("noodles1")
	elif itemType == "Eggplant-Zucchini Noodles":
		dish = true
		$Sprite.play("noodles2")
	elif itemType == "Tomato-Zucchini Noodles":
		dish = true
		$Sprite.play("noodles3")
	elif itemType == "Carrot-Tomato-Zucchini Salad":
		dish = true
		$Sprite.play("salad")
		
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



