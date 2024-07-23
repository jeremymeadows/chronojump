extends Node

var time = 0


func _process(delta: float) -> void:
	if $Game/Player.running:
		time += delta
		$CanvasLayer/Label.text = str(snapped(time, 0.001))
