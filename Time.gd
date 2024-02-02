extends Label

var time : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	text = "%d:%02d" % [floor(time / 60), int(time) % 60]
	pass	
