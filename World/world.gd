extends Node2D
@export var algee_scene: PackedScene

var algee_count

func _on_algee_timer_timeout():
	# creates a new instance of the Mob scene (so it basically creates the mob)
	var algee = algee_scene.instantiate()
	
	# sets the spawn location of the mob on a random point of the `MobSpawnLocation` Path2D (which is basically anywhere on the edge of the screen)
	var algee_spawn_location = get_node("MobPath/MobSpawnLocation")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

