extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = Vector2(OS.window_size.x/2, OS.window_size.y/2)
	if OS.window_size.x > OS.window_size.y:
		scale.x = OS.window_size.x/32
		scale.y = scale.x
	else :
		scale.x = OS.window_size.y/32
		scale.y = scale.x
