extends CanvasLayer
@onready var player_vars = get_node("/root/PlayerVariables")
var upgrade_open = false

func show_algee_count(count):
	$algeeCount.text = str(count)


# Called when the node enters the scene tree for the first time.
func _ready():
	$UpgradeMenu.hide()
	$BackgroundLayer.hide()
	$Background.hide()
	$Frame.hide()
	$HealthBar.value = player_vars.health
	$HealthTImer.start()




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	show_algee_count(player_vars.algee_count)
	$HealthBar.value = player_vars.health



func _on_player_collected_algee():
	pass



func _on_menu_button_pressed():
	if upgrade_open == false:
		$UpgradeMenu.show()
		$Background.show()
		$BackgroundLayer.show()
		$Frame.show()
		upgrade_open = true
		
	elif upgrade_open == true:
		$UpgradeMenu.hide()
		$Background.hide()
		$BackgroundLayer.hide()
		$Frame.hide()
		upgrade_open = false


func _on_upgrade_menu_health_increased():
	$HealthBar.max_value = player_vars.max_health


func _on_health_t_imer_timeout():
	if player_vars.health < player_vars.max_health:
		player_vars.health += player_vars.max_health / 20
		$HealthBar.value = player_vars.health
	elif player_vars.health > player_vars.max_health:
		player_vars.health = player_vars.max_health
