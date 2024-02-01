extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var ingredient = preload("res://Ingredient.tscn").instantiate()
	ingredient.setup("apple", Vector2(100, 100))
	add_child(ingredient)
	print(get_children())

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
