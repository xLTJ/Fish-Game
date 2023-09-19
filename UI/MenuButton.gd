extends MenuButton


enum ItemId {
	LEVEL1,
	LEVEL2,
	LEVEL3
}

func _ready():
	$MenuButton.get_popup().add_item("Level 1", ItemId.LEVEL1)
	$MenuButton.get_popup().add_item("Level 2", ItemId.LEVEL2)
	$MenuButton.get_popup().add_item("Level 3", ItemId.LEVEL3)
	$MenuButton.get_popup().id_pressed.connect(_on_item_menu_pressed)

func _on_item_menu_pressed(id: int):
	print("Item ID: ", id)
