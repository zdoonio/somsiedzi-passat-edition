extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 100
const SPEED = 25000
const JUMP_HEIGHT = -25000

var motion = Vector2()

func _process(delta):
	motion.y += GRAVITY * delta
	
	if Input.is_action_pressed("right"):
		#print("right")
		motion.x = SPEED * delta
		
	elif Input.is_action_pressed("left"):
		#print("left")
		motion.x = -SPEED * delta
	else: 
		motion.x = 0


				
	
	if is_colliding():
		if Input.is_key_pressed(KEY_SPACE):
			motion.y = JUMP_HEIGHT * delta
		#print("Collision")
		print(get_collision_pos())
		if get_collision_pos().x > 840:
			#print("drzwi")
			if Input.is_action_pressed("up"):
				self.set_pos(Vector2(550, -355)) 
		
	
	motion = move_and_slide(motion)
	
func _ready():
	set_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
