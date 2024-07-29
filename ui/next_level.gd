extends Control


func _ready() -> void:
	var time := Global.time
	var record = Global.records.get(Global.level, INF)
	
	$Time.text = "%.03fs" % time
	
	if Global.time < record:
		$Record.text = "NEW RECORD!"
		Global.records[Global.level] = time
	else:
		$Record.text = "Your best is %.03fs" % record
	
	if Global.level == Global.MAX_LEVEL:
		$Next.queue_free()
	
	Global.scores[Global.level] = time
	Global.save_game()
	
	if OS.get_name() == "Web":
		$Quit.queue_free()


func _on_next_pressed() -> void:
	Global.level += 1


func _on_replay_pressed() -> void:
	Global.level = Global.level


func _on_menu_pressed() -> void:
	Global.main_menu()


func _on_quit_pressed() -> void:
	Global.quit()
