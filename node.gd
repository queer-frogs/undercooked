extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_ingredient(type:String, position: Vector2, originBox: Box):
	var ingredient = preload("res://Ingredient.tscn").instantiate()
	ingredient.setup(type, position, originBox)
	add_child.call_deferred(ingredient)
