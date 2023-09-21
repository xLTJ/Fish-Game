extends Area2D

signal blob_touch

func _ready():
	pass

func _on_body_entered(body):
	blob_touch.emit()
	$Speech_bubble.hide()

