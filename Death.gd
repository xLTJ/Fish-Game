extends CanvasLayer
var scene_id = 0

func _ready():
	$DeathText.hide()
	$TextHide.hide()
	$DeathSprites.hide()
	$Glitch_effect.hide()


func _process(delta):
	if Input.is_action_just_pressed('skip'):
		do_stuff()
		if scene_id == 1:
			get_tree().quit()



func _on_player_player_is_dead():
	$end.play()
	get_parent().main_theme.stop()
	$DeathAnimationPlayer.play('Fade')
	await get_tree().create_timer(1).timeout
	$DeathSprites.show()
	$DeathSprites.play("default")
	$TextHide.show()
	$DeathAnimationPlayer.play('Text_fade')
	$DeathText.show()
	await get_tree().create_timer(3).timeout
	$DeathSprites.pause()



func _on_button_pressed():
	do_stuff()
	if scene_id == 1:
		get_tree().quit()

func do_stuff():
	if scene_id == 0:
		$DeathAnimationPlayer.play('text_hide')
		await get_tree().create_timer(1).timeout
		$DeathSprites.hide()
		$DeathText.text = 'YOU FAILED TO SAVE THEM'
		await get_tree().create_timer(1).timeout
		$DeathAnimationPlayer.play('Text_fade')
		await get_tree().create_timer(3).timeout
		$Glitch_effect.show()
		await get_tree().create_timer(0.05).timeout
		$Glitch_effect.hide()
		await get_tree().create_timer(1).timeout
		$Glitch_effect.show()
		await get_tree().create_timer(0.05).timeout
		$Glitch_effect.hide()
		await get_tree().create_timer(0.5).timeout
		$Glitch_effect.show()
		await get_tree().create_timer(0.05).timeout
		$Glitch_effect.hide()
		await get_tree().create_timer(0.05).timeout
		$Glitch_effect.show()
		await get_tree().create_timer(0.05).timeout
		$Glitch_effect.hide()
		await get_tree().create_timer(0.05).timeout
		$Glitch_effect.show()
		$DeathText.text = 'TRY AGAIN?'
		$DeathAnimationPlayer.play('text_hide')
		await get_tree().create_timer(3).timeout
		$Glitch_effect.hide()
		$DeathAnimationPlayer.play('Text_fade')
		scene_id = 1

