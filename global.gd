extends Node


const MAX_LEVEL := 3

var running := false
var time := 0.0
var level := 0 : set=__set_level
var scores := {}
var records := {}
var window := {}


func _ready() -> void:
	get_window().size = Vector2i(1920, 1080)
	load_game()


func _process(delta: float) -> void:
	if running:
		time += delta


func save_game() -> void:
	var file := FileAccess.open("user://game.save", FileAccess.WRITE)
	file.store_var({
		"position": get_window().position,
		"size": get_window().size,
		"scores": scores,
		"records": records,
	})
	file.close()


func load_game():
	var file := FileAccess.open("user://game.save", FileAccess.READ)
	if file:
		var data = file.get_var(true)
		get_window().size = data.get("size", Vector2i(640, 360))
		get_window().position = data.get("position", Vector2i(0, 0))
		
		scores = data.get("scores", {})
		records = data.get("records", {})
	file.close()


func quit():
	save_game()
	get_tree().quit()


func main_menu():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")


func __set_level(new_level: int) -> void:
	running = false
	level = new_level
	scores[level] = time
	time = 0.0
	get_tree().change_scene_to_file("res://levels/level_%d.tscn" % level)
