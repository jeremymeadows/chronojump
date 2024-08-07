extends Control


func _ready() -> void:
	for i in range(Global.MAX_LEVEL + 1):
		var new = $Level.duplicate()
		new.position.x += 128 * (i / 4)
		new.position.y += 64 * (i % 4)
		new.get_child(0).text = "Level %d" % i
		new.get_child(1).text = "%.03fs" % Global.records.get(i, INF)
		new.connect("pressed", func(): Global.level = i)
		add_child(new)
	$Level.queue_free()


func _on_menu_pressed() -> void:
	Global.main_menu()
