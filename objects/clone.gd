extends AnimatableBody2D


var path := []
var frame := 0


func _physics_process(_delta: float) -> void:
	if not Global.running:
		return
	
	if frame < path.size():
		self.position = path[frame]
		frame += 1
	else:
		$Sprite2D/AnimationPlayer.play('fade')
		$Sprite2D/AnimationPlayer.connect("animation_finished", func(anim_name: StringName):
			if anim_name == "fade":
				$CollisionShape2D.disabled = true
		)
		stop()


func replay():
	frame = 0
	self.position = path[frame]
	self.visible = true
	$CollisionShape2D.disabled = false
	$Sprite2D/AnimationPlayer.stop()
	set_physics_process(true)


func stop():
	set_physics_process(false)
