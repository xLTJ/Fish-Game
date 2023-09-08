extends CharacterBody2D

@export var speed: int = 200
@onready var player_animation = $AnimationPlayer
@onready var player_sprite = $Sprite2D
var direction = 'up' # Direction the player faces. Default is up


# Gets the input of the player and sets the players velocity. get_vector specefies four actions for the positive and negative X and Y axes. For instance 'move_left' is for negative_x (aka left)
func player_input():
	var movement_direction = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
	
	if movement_direction.length() > 0:
		velocity = movement_direction.normalized() * speed
	else: velocity = Vector2.ZERO # without this the player keeps moving when the key is released


# Animates the player depending on their move direction
func player_animation_update():
	var state = 'idle' # Default state is idle, if the vector is not equal to 0 (meaning the player moves) the state will be set to moving
	if velocity.length() != 0: # if the player moves the direction of the player will be changed. This direction determines what way the player faces, and is kept until the player moves another way
		state = 'moving'
		if velocity.y > 0: direction = 'down'
		elif velocity.y < 0: direction = 'up'
		elif velocity.x != 0: direction = 'horizontal'
		player_sprite.flip_h = velocity.x < 0 # flips the sprite so the player faces left if theyre moving left
	
	# Plays the moving or the idle animation depending on the state
	if state == 'moving':
		player_animation.play('walk_' + direction)
	else: 
		player_animation.play('idle_' + direction)


# This runs every frame
func _physics_process(delta):
	player_input()
	move_and_slide()
	player_animation_update()

