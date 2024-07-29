extends Control


func _ready() -> void:
	$Resolution/ItemList.select(Global.RESOLUTIONS.find(get_window().size))


func _on_menu_pressed() -> void:
	Global.main_menu()


func _on_item_list_item_selected(index: int) -> void:
	get_window().size = Global.RESOLUTIONS[index]


func _on_item_list_tree_exiting() -> void:
	Global.save_game()
