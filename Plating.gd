extends RigidBody2D
class_name Plating

var capacity: int = 3
var used_slots: int = 0
var playerUser: CharacterBody2D = null
var lastIngredient: Ingredient = null
var ingredient_types: Array[String] = []
var full = false
var resultType: String = ""

const recipes = {
	["cookedEggplant", "cookedEggplant", "cookedEggplant"] : "Moussaka",
	["choppedCarrot", "choppedTomato", "choppedZucchini"]: "Carrot-Tomato-Zucchini Salad",
	["boiledNoodles", "cookedCarrot", "cookedTomato"] : "Tomato-Carrot Noodles",
	["boiledNoodles", "cookedEggplant", "cookedZucchini"] : "Eggplant-Zucchini Noodles",
	["boiledNoodles", "cookedTomato", "cookedZucchini"] : "Tomato-Zucchini Noodles",
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(_event):
	if Input.is_action_just_pressed("interact_1"):
		var bodies = $UseArea.get_overlapping_bodies()
		for body in bodies:
			if body.name == "Character1":
				playerUser = body			
		if playerUser != null:
			var area = $UseArea.get_overlapping_areas()
			print(area)
			if area :
				lastIngredient = area[0].get_parent()
				if lastIngredient.just_dropped:
					ingredient_types.append(lastIngredient.itemType)
					lastIngredient.queue_free()
					used_slots += 1
			if used_slots == capacity:
				plating()
				
	if Input.is_action_just_pressed("interact_2"):
		var bodies = $UseArea.get_overlapping_bodies()
		for body in bodies:
			if body.name == "Character2":
				playerUser = body
		if playerUser != null:
			var area = $UseArea.get_overlapping_areas()
			print(area)
			if area :
				lastIngredient = area[0].get_parent()
				if lastIngredient.just_dropped:
					ingredient_types.append(lastIngredient.itemType)
					lastIngredient.queue_free()
					used_slots += 1
			if used_slots == capacity:
				plating()

func plating():
	ingredient_types.sort()
	if ingredient_types in recipes.keys():
		resultType = recipes[ingredient_types]
	else:
		resultType = "coal"
	var pos = global_position
	pos[1] -= 50
	get_parent().spawn_ingredient(resultType, pos, null)
	ingredient_types = []
	used_slots = 0

	
	
