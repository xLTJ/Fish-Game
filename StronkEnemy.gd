extends CharacterBody2D

@onready var player_vars = get_node("/root/PlayerVariables")
@onready var global = get_node("/root/Global")
@export var projective_scene: PackedScene

@export var detect_range = 500
@export var speed = 100
@export var limit = 1
@export var health = 20
@export var alive = true

var startPosition
var endPosition
var shooting = false

func _ready():
	startPosition = position
	endPosition = startPosition + Vector2(0, 64)
	$HealthBorder/HealthBar.value = health
	$Sprite2D2.hide()

func changeDirection():
	var newEnd = endPosition + Vector2(randi_range(-64, 64), randi_range(-64, 64))
	
	# Makes the enemy stay inside the world border
	if newEnd.x < 10:
		newEnd.x = 20
	if newEnd.x > global.world_size.x - 10:
		newEnd.x = global.world_size.x - 20
	if newEnd.y < 10:
		newEnd.y = 20
	if newEnd.y > global.world_size.y - 10:
		newEnd.y = global.world_size.y - 20
	
	endPosition = newEnd

func velocityUpdate():
	var movement = endPosition - position
	if movement.length() < limit:
		position = endPosition
		movement = Vector2.ZERO
		changeDirection()
	velocity = movement.normalized()*speed



func _physics_process(delta):
	if alive == true:
		velocityUpdate()
		move_and_slide()
	
	if position.distance_to(player_vars.position) < detect_range and shooting == false:
		$ProjectileTimer.start()
		print('start')
		shooting = true
	
	if position.distance_to(player_vars.position) > detect_range and shooting == true:
		$ProjectileTimer.stop()
		print('stop')
		shooting = false



func _on_area_2d_body_entered(body):
	get_parent().hit_sound.play()
	health -= player_vars.player_damage
	body.enemy_hit()
	$HealthBorder/HealthBar.value = health
	print(health)
	
	if health <= 0:
		enemy_dead(body)

func enemy_dead(body):
	get_parent().death_sound.play()
	$Sprite2D2.show()
	$DeathAnimation.play('Death')
	alive = false
	velocity = Vector2.ZERO
	player_vars.algee_count += 40 * player_vars.algee_multipler
	body.algee_collected()
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	await get_tree().create_timer(0.6).timeout
	global.stronk_enemy_count -= 1
	queue_free()
	


func _on_death_animation_animation_finished(anim_name):
	pass


func _on_projectile_timer_timeout():
	var projectile = projective_scene.instantiate()
	projectile.position = position
	print('KILL THEM KILL THEM KILL THEM')
	
	get_parent().add_child(projectile)
