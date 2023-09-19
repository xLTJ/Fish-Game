extends CharacterBody2D
@onready var player_vars = get_node("/root/PlayerVariables")
@export var speed = 200

var end_position

# Called when the node enters the scene tree for the first time.
func _ready():
	end_position = player_vars.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = (end_position - position).normalized()
	var velocity = direction * speed
	move_and_slide(velocity)


func _on_area_2d_body_entered(body):
	pass # Replace with function body.

