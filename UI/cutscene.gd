extends CanvasLayer
@export var dialogeID = 0
@onready var player_vars = get_node("/root/PlayerVariables")
@onready var global = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Blobfish.play()
	get_parent().main_theme.volume_db = -20
	$Name.text = 'Blobfish'
	get_tree().paused = true
	if global.cutsceneID == 0:
		dialoge1()
		if dialogeID == 0:
			$need_help.play()
	elif global.cutsceneID == 1:
		dialoge2()
	elif global.cutsceneID == 2:
		dialoge3()
	else:
		dialoge4()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	skip_dialogue()
	print(global.cutsceneID)


func _on_button_pressed():
	start_dialoge()

func start_dialoge():
	dialogeID += 1
	if global.cutsceneID == 0:
		dialoge1()
	elif global.cutsceneID == 1:
		dialoge2()
	elif global.cutsceneID == 2:
		dialoge3()
	else:
		dialoge4()

func dialoge1():
	if dialogeID == 0:
		$Dialoge.text = 'We need your help!'
	elif dialogeID == 1:
		$need_help.stop()
		$sob_sob.play()
		$Dialoge.text = '*Sob sob sob sob*'
	elif dialogeID == 2:
		$sob_sob.stop()
		$Dialoge.text = 'The coral reef is dying! Humans create too much pollution and it’s bleaching the corals, and we need them to breathe!'
		$coral_reef_be_dying.play()
	elif dialogeID == 3:
		$coral_reef_be_dying.stop()
		$Dialoge.text = '*Sob sob sob sob*'
		$sob_sob.play()
	elif dialogeID == 4:
		$Dialoge.text = '*The blobfish holds up a picture frame of another blobfish*'
	elif dialogeID == 5:
		$sob_sob.stop()
		$Dialoge.text = 'My wife. She passed away. This is urgent. We can’t just die because of these stupid humans! '
		$wife_ded.play()
	elif dialogeID == 6:
		$wife_ded.stop()
		$Dialoge.text = '*The blobfish mumbles something angrily*'
		$angry_mumble.play()
	elif dialogeID == 7:
		$angry_mumble.stop()
		$Dialoge.text = 'You must help with your almighty poison - do something quickly! We shall eliminate them before they do so to us…'
		$kill_humans_hehe.play()
	elif dialogeID == 8:
		$kill_humans_hehe.stop()
		$Dialoge.text = 'You are our only hope'
		$only_hope.play()
	elif dialogeID == 9:
		$only_hope.stop()
		global.cutsceneID += 1
		get_tree().paused = false
		get_parent().main_theme.volume_db = -10
		queue_free()

func dialoge2():
	if dialogeID == 0:
		$Dialoge.text = 'its fish heroin\' time 🔥🔥'
	elif dialogeID == 1:
		global.cutsceneID += 1
		get_tree().paused = false
		get_parent().main_theme.volume_db = -10
		queue_free()

func dialoge3():
	if dialogeID == 0:
		$Dialoge.text = 'Dont just stand there, go out and kill people >:('
	elif dialogeID == 1:
		global.cutsceneID += 1
		get_tree().paused = false
		get_parent().main_theme.volume_db = -10
		queue_free()

func dialoge4():
	print(dialogeID)
	if dialogeID == 0:
		$Dialoge.text = 'WHY ARE YOU STILL HERE???'
	elif dialogeID == 1:
		get_tree().paused = false
		get_parent().main_theme.volume_db = -10
		queue_free()

func skip_dialogue():
	var has_pressed = false
	if Input.is_action_just_pressed('skip'):
		start_dialoge()
	#if Input.is_action_just_pressed()
