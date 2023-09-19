extends CharacterBody2D
@onready var player_vars = get_node("/root/PlayerVariables")
@export var speed = 400
@export var damage = 10

var end_position

func _ready():
	end_position = player_vars.position
	var direction = (end_position - position).normalized()
	velocity = direction * speed
	print('pp = ' + str(position))
	print(player_vars.position)


func _physics_process(delta):
	move_and_slide()


func _on_area_2d_body_entered(body):
	get_parent().hit_sound.play()
	player_vars.health -= damage
	print(player_vars.health)
	queue_free()



func _on_existance_timer_timeout():
	queue_free()
