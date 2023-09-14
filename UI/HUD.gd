extends CanvasLayer
@onready var player_vars = get_node("/root/PlayerVariables")

func show_algee_count(count):
	$algeeCount.text = str(count)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_player_collected_algee():
	show_algee_count(player_vars.algee_count)
