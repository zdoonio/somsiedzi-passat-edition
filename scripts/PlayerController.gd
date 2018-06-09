extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 100
const SPEED = 25000
const JUMP_HEIGHT = -25000

var motion = Vector2()
var isPlanted = false

func _process(delta):
	var area = get_node("PlayerArea")
	var timer = get_node("Timer")
	var actualColiders = get_move_and_slide_colliders()
	var bombSound = get_node("BombSound")
	var soundRandomize = randi()% 3 + 1
	
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

		for colider in actualColiders:
			#print(colider.get_name())
			
			if Input.is_action_pressed("up") and colider.get_name() == "Door":
				#timer.start()
				#colider.get_node("AnimatedSprite").play("Open")
				self.set_pos(get_pos() + Vector2(0, -600))
				#colider.get_node("AnimatedSprite").play("Idle")
				
			elif Input.is_action_pressed("down") and colider.get_name() == "Door":
				self.set_pos(get_pos() + Vector2(0, 600))
				 
			elif Input.is_action_pressed("up") and colider.get_name() == "Passat":
				print("Zaplantowano bombe")
				if soundRandomize == 1:
					bombSound.play("Bomb0")
				elif soundRandomize == 2:
					bombSound.play("Bomb1")
				elif soundRandomize == 3:
					bombSound.play("Bomb2")
					
				colider.get_node("Bomb").play("Planted")
				isPlanted = true
				
	
	#if isPlanted:
		#VisualServer.set_default_clear_color(Color(0.05 , 1, 0.05, 1))		

	motion = move_and_slide(motion)

func _ready():
	var soundRandomize = randi()% 3 + 1
	set_process(true)
	
	if soundRandomize == 1:
		get_node("IdleSound").play("Idle1")
	elif soundRandomize == 2:
		get_node("IdleSound").play("Idle2")
	elif soundRandomize == 3:
		get_node("IdleSound").play("Idle3")
	
	# Called every time the node is added to the scene.
	# Initialization here
	pass
