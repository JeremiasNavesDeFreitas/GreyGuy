extends KinematicBody2D
const MOTION_SPEED = 100
func _physics_process(_delta):
	var motion = Vector2()
	var moved = false
