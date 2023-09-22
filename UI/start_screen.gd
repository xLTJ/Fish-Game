extends CanvasLayer
signal game_started


func _on_button_pressed():
	get_tree().paused = false
	hide()
	game_started.emit()
