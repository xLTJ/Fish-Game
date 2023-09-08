extends Area2D
var size

func random_pos():
	size = $CollisionShape2D.shape.extents
	
	position.x = (randi() % size.x) - (size.x / 2)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

