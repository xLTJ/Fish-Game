extends VBoxContainer
@onready var player_vars = get_node("/root/PlayerVariables")
@onready var global = get_node("/root/Global")
@onready var upgrade_buttons = [$VBoxContainer1/BuyButton1, $VBoxContainer2/BuyButton2, $VBoxContainer3/BuyButton3, $VBoxContainer4/BuyButton4, $VBoxContainer5/BuyButton5, $VBoxContainer6/BuyButton6, $VBoxContainer7/BuyButton7, $VBoxContainer8/BuyButton8, 'placeholder']

signal health_increased

# Called when the node enters the scene tree for the first time.
func _ready():
	for node in get_children():
		global.player_upgrades.append(0)
	for i in range(len(global.player_upgrades) - 1):
		update_price(i)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_buy_button_1_pressed():
	if global.player_upgrades[0] == 0:
		if player_vars.algee_count >= global.upgrade_prices[0]:
			global.player_upgrades[0] += 1
			player_vars.player_damage *= 2
			player_vars.algee_count -= global.upgrade_prices[0]
			$VBoxContainer1/DescriptionContainer/Description.text = 'Increase your damage by x2 (current: x2)'
			
			global.upgrade_prices[0] = 300
			update_price(0)
			
	elif global.player_upgrades[0] == 1:
		if player_vars.algee_count >= global.upgrade_prices[0]:
			global.player_upgrades[0] += 1
			player_vars.player_damage *= 2
			player_vars.algee_count -= global.upgrade_prices[0]
			$VBoxContainer1/DescriptionContainer/Description.text = 'Increase your damage by x2 (current: x4)'
			
			global.upgrade_prices[0] = 1300
			update_price(0)
			
	elif global.player_upgrades[0] == 2:
		if player_vars.algee_count >= global.upgrade_prices[0]:
			global.player_upgrades[0] += 1
			player_vars.player_damage += 2
			player_vars.algee_count -= global.upgrade_prices[0]
			$VBoxContainer1/DescriptionContainer/Description.text = 'Increase your damage multiplier by x2 (current: x6)'
			
			upgrade_buttons[0].text = 'bought'
			upgrade_buttons[0].disabled = true



func update_price(buttonID):
	print(len(upgrade_buttons))
	upgrade_buttons[buttonID].text = str(global.upgrade_prices[buttonID]) + ' A'
	


func _on_buy_button_2_pressed():
	if global.player_upgrades[1] == 0:
		if player_vars.algee_count >= global.upgrade_prices[1]:
			global.player_upgrades[1] += 1
			player_vars.max_health += 50
			player_vars.algee_count -= global.upgrade_prices[1]
			$VBoxContainer2/DescriptionContainer/Description.text = 'Increase your max health by 50 (current: 150)'
			
			health_increased.emit()
			global.upgrade_prices[1] = 200
			update_price(1)

	elif global.player_upgrades[1] == 1:
		if player_vars.algee_count >= global.upgrade_prices[1]:
			global.player_upgrades[1] += 1
			player_vars.max_health += 50
			player_vars.algee_count -= global.upgrade_prices[1]
			$VBoxContainer2/DescriptionContainer/Description.text = 'Increase your max health by 50 (current: 200)'
			
			upgrade_buttons[1].text = 'bought'
			upgrade_buttons[1].disabled = true




func _on_buy_button_3_pressed():
	if global.player_upgrades[2] == 0:
		if player_vars.algee_count >= global.upgrade_prices[2]:
			global.player_upgrades[2] += 1
			player_vars.speed *= 1.5
			player_vars.algee_count -= global.upgrade_prices[2]
			$VBoxContainer3/DescriptionContainer/Description.text = 'Increase your speed to x1.5 (current: x1.5)'
			
			upgrade_buttons[2].text = 'bought'
			upgrade_buttons[2].disabled = true



func _on_buy_button_4_pressed():
	if global.player_upgrades[3] == 0:
		if player_vars.algee_count >= global.upgrade_prices[3]:
			global.player_upgrades[3] += 1
			player_vars.algee_multipler *= 2
			player_vars.algee_count -= global.upgrade_prices[3]
			$VBoxContainer4/DescriptionContainer/Description.text = 'Increase the algees you get by x2 (current: x2)'
			
			global.upgrade_prices[3] = 400
			update_price(3)
			
	elif global.player_upgrades[3] == 1:
		if player_vars.algee_count >= global.upgrade_prices[3]:
			global.player_upgrades[3] += 1
			player_vars.algee_multipler *= 2
			player_vars.algee_count -= global.upgrade_prices[3]
			$VBoxContainer4/DescriptionContainer/Description.text = 'Increase the algees you get by x2 (current: x4)'
			
			upgrade_buttons[3].text = 'bought'
			upgrade_buttons[3].disabled = true
