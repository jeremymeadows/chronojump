extends AnimatableBody2D

var path = []
var frame = 0

var running = Global.running

func _physics_process(delta: float) -> void:
	if not running:
		return
	
	if frame < path.size():
		self.position = path[frame]
		frame += 1
	else:
		stop()

func start():
	running = true

func replay():
	frame = 0
	set_physics_process(true)

func stop():
	set_physics_process(false)
