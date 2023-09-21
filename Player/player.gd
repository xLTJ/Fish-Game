extends CharacterBody2D

signal collected_algee
signal killed_enemy
signal player_is_dead
@onready var player_sprite = $AnimatedSprite2D
@onready var speech_bubble = $Speech_bubble
@onready var speech_text = $Speech_bubble/SpeechBubbleText
@onready var player_vars = get_node("/root/PlayerVariables")
var direction = 'up' # Direction the player faces. Default is up

var last_velocity

func _ready():
	speech_bubble.hide()

func _process(delta):
	if player_vars.health <= 0:
		player_death()
		player_vars.is_dead = true
		
	if speech_bubble.is_visible_in_tree():
		if player_vars.has_opened_menu == true:
			speech_bubble.hide()
		

# Gets the input ofs the player and sets the players velocity. get_vector specefies four actions for the positive and negative X and Y axes. For instance 'move_left' is for negative_x (aka left)
func player_input():
	if player_vars.can_move == true:
		var movement_direction = Input.get_vector('move_left', 'move_right', 'move_up', 'move_down')
		
		if movement_direction.length() > 0:
			velocity = movement_direction.normalized() * player_vars.speed
			last_velocity = velocity
			
			# Turns off the timer for no movement if the player moves
			if player_vars.has_moved == false:
				player_vars.has_moved = true
				$NoMovementTimer.stop()
				speech_bubble.hide()
				$UpgradeMenuTimer.start()
				
		else: velocity = Vector2.ZERO # without this the player keeps moving when the key is released


# Animates the player depending on their move direction
func player_animation_update():
	var state = 'idle' # Default state is idle, if the vector is not equal to 0 (meaning the player moves) the state will be set to moving
	if velocity.length() != 0: # if the player moves the direction of the player will be changed. This direction determines what way the player faces, and is kept until the player moves another way
		state = 'moving'
		if velocity.y > 0: direction = 'down'
		elif velocity.y < 0: direction = 'up'
		elif velocity.x != 0: direction = 'horizontal'
		player_sprite.flip_h = velocity.x > 0 # flips the sprite so the player faces left if theyre moving left
	
	# Plays the moving or the idle animation depending on the state
	if state == 'moving':
		player_sprite.play('move_' + direction)
	# else: 
	# 	 player_animation.play('idle_' + direction)


func algee_collected():
	collected_algee.emit()

# This runs every frame
func _physics_process(delta):
	player_input()
	move_and_slide()
	player_animation_update()
	
	player_vars.position = position


func enemy_hit():
	player_vars.can_move = false
	velocity = last_velocity * -2
	await get_tree().create_timer(0.15).timeout
	player_vars.can_move = true


func player_death():
	get_tree().paused = true
	player_is_dead.emit()




func _on_no_movement_timer_timeout():
	speech_bubble.show()
	speech_text.text = "hmm...     i should use 'wasd' to move..."



func _on_upgrade_menu_timer_timeout():
	speech_bubble.show()
	speech_text.text = 'im weak, pls make me stronger (press [U])'
