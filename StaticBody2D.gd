extends Area2D
@onready var player_vars = get_node("/root/PlayerVariables")


func _on_body_entered(body): 
	print('hit')
	player_vars.algee_count += 1
	body.algee_collected()
	queue_free() # Algee gets deleted after being hit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

