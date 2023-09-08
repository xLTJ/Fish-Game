extends Node2D
@export var tilemap: TileMap
@export var algee_scene: PackedScene

@onready var player_vars = get_node("/root/PlayerVariables")

func _on_algee_timer_timeout():
	# creates a new instance of the Mob scene (so it basically creates the mob)
	var algee = algee_scene.instantiate()
	
	var world_borders = tilemap.get_used_rect() # Gets the amount of tiles used
	var tile_size = tilemap.cell_quadrant_size # Gets tje size of each tile in pixels
	var world_size = world_borders.size * tile_size # The size of the world in pixels
	algee.position = Vector2(randi_range(10, world_size.x - 10), randi_range(10, world_size.y - 10))
	
	add_child(algee)


func algee_collected():
	player_vars.algee_count += 1
	print(player_vars.algee_count)


# Called when the node enters the scene tree for the first time.
func _ready():
	print('yes')
	$AlgeeTimer.start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

