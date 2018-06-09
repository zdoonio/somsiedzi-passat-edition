extends KinematicBody2D

const GRAVITY = 0.1
const JUMP_HEIGHT = -25

var somsiadThink
var speed = 12500
var previousPosition = Vector2()
var motion = Vector2()
var directionFlag = true

func _process(delta):
	var actualPosition = self.get_pos()
	var animitedSprite = get_node("AnimatedSprite")
	var actualColiders = get_move_and_slide_colliders()
	var somsiadThink = randi()% 101 + 1
	
	motion.y += GRAVITY
	motion.x = -speed * delta
	motion = move_and_slide(motion)
	#print("actual: ", actualPosition)
	#print("previous: ", previousPosition)
	#print(get_move_and_slide_colliders())
	
	
	if is_colliding():
		if Input.is_key_pressed(KEY_SPACE):
			motion.y = JUMP_HEIGHT * delta

		for colider in actualColiders:
			#print(colider.get_name())
			#print (colider.get_z())
			if colider.get_name() == "Wall" or colider.get_name() == "Wall1" or colider.get_name() == "Wall2" or  colider.get_name() == "Door":
				directionFlag = !directionFlag
				speed = speed * -1
				
			if colider.get_name() == "Door" and somsiadThink > 50:
				self.set_pos(get_pos() + Vector2(0, -2400))
		
	if directionFlag:
		animitedSprite.play("Left")
	else:
		animitedSprite.play("Right")
		
	previousPosition = actualPosition
	
	
func _ready():
	set_process(true)
	
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	