extends Camera2D
@export var tilemap: TileMap

func _ready():
	var world_borders = tilemap.get_used_rect() # Gets the amount of tiles used
	var tile_size = tilemap.cell_quadrant_size # Gets tje size of each tile in pixels
	var world_size = (world_borders.size - Vector2i(2,2)) * tile_size # The size of the world in pixels
	
	# Sets the limits of the camara to the size of the world
	limit_right = world_size.x
	limit_bottom = world_size.y
