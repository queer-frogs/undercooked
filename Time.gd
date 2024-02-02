extends Label

var time : float = 0.0
var running : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("connect_to_signal")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if running:
		time += delta
		text = "%d:%02d" % [floor(time / 60), int(time) % 60]

func connect_to_signal():
	var manager = get_node("../Game_manager")
	print(manager)
	manager.victory_signal.connect(on_victory)
	print("connected")

func on_victory():
	print("stopped")
	running = false
