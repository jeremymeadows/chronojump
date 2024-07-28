extends Control


func _ready() -> void:
	for i in range(Global.MAX_LEVEL + 1):
		var new = $Level.duplicate()
		new.position.y += i * 64
		new.text = "Level %d" % i
		new.get_child(0).text = "%.03fs" % Global.records[i]
		new.connect("pressed", func(): select_level(i))
		add_child(new)
	$Level.queue_free()


func _on_menu_pressed() -> void:
	Global.main_menu()


func select_level(level):
	Global.level = level
