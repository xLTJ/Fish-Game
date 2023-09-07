extends CharacterBody2D

@export var speed: int = 40

func playerInput():
	var movementDirection = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	velocity = movementDirection * speed

func _physics_process(delta):
	playerInput()
	move_and_slide()
