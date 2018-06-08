extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 0.1
const SPEED = 25
const JUMP_HEIGHT = -25

var motion = Vector2()

func _process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("right"):
		print("right")
		motion.x = SPEED
		
	elif Input.is_action_pressed("left"):
		print("left")
		motion.x = -SPEED
	else: 
		motion.x = 0

	
	if Input.is_key_pressed(KEY_SPACE):
			motion.y = JUMP_HEIGHT
				
	
	motion = move_and_slide(motion)
	
func _ready():
	set_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
