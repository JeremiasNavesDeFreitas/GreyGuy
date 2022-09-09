extends KinematicBody2D

# This is a demo showing how KinematicBody2D
# move_and_slide works.

# Member variables
const MOTION_SPEED = 200 # Pixels/second


func _physics_process(_delta):
	var motion = Vector2()
	var moved = false
	
	if Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -1)
		moved = true
	elif Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
		moved = true


	if Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
		moved = true
		get_node("AnimatedSprite").flip_h = true
	elif Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
		moved = true
		get_node("AnimatedSprite").flip_h = false
	
	motion = motion.normalized() * MOTION_SPEED

	move_and_slide(motion)
	
	if(moved):
		get_node("AnimatedSprite").play("Andando")
	else:
		get_node("AnimatedSprite").play("Parado")
