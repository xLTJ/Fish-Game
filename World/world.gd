# Welcome to the most fucked up and messy code u have ever seen in ur life c;

extends Node2D
@export var tilemap: TileMap
@export var algee_scene: PackedScene
@export var enemy_scene: PackedScene
@export var stronk_enemy_scene: PackedScene
@export var start_cutscene: PackedScene

@export var enemy_limit = 20
@export var stronk_enemy_limit = 10

@onready var global = get_node("/root/Global")
@onready var player_vars = get_node("/root/PlayerVariables")

@onready var main_theme = $main_theme
@onready var collect_sound = $collect_sound
@onready var hit_sound = $hit_sound
@onready var death_sound = $death_sound


func _on_algee_timer_timeout():
	# creates a new instance of the algee scene (so it basically creates the algee)
	var algee = algee_scene.instantiate()
	algee.position = Vector2(randi_range(10, global.world_size.x - 10), randi_range(10, global.world_size.y - 10))

	add_child(algee)



func algee_collected():
	collect_sound.play()
	print(player_vars.algee_count)


# Called when the node enters the scene tree for the first time.
func _ready():
	$AlgeeTimer.start()
	$EnemySpawnTimer.start()
	$StronkEnemySpawnTimer.start()
	$Death.hide()
	var world_borders = tilemap.get_used_rect() # Gets the amount of tiles used
	var tile_size = tilemap.cell_quadrant_size # Gets tje size of each tile in pixels
	global.world_size = (world_borders.size - Vector2i(2,2)) * tile_size
	main_theme.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_enemy_spawn_timer_timeout():
	if global.enemy_count < enemy_limit:
		var enemy = enemy_scene.instantiate()
		enemy.position = Vector2(randi_range(10, global.world_size.x - 10), randi_range(10, global.world_size.y - 10))
		global.enemy_count += 1
		
		add_child(enemy)

func _on_stronk_enemy_spawn_timer_timeout():
	if global.stronk_enemy_count < stronk_enemy_limit:
		var stronk_enemy = stronk_enemy_scene.instantiate()
		stronk_enemy.position = Vector2(randi_range(10, global.world_size.x - 10), randi_range(10, global.world_size.y - 10))
		global.stronk_enemy_count += 1
		
		add_child(stronk_enemy)


func _on_blob_body_entered(body):
	var cutscene = start_cutscene.instantiate()
	add_child(cutscene)
	$Player.velocity = Vector2.ZERO


func _on_player_player_is_dead():
	$Death.show()
