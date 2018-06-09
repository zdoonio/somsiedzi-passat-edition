extends KinematicBody2D

const GRAVITY = 0.1
const JUMP_HEIGHT = -25

var speed = 25
var previousPosition = Vector2()
var motion = Vector2()

func _process(delta):
	var actualPosition = self.get_pos()
	var animitedSprite = get_node("AnimatedSprite")
	var directionFlag = true
	
	motion.y += GRAVITY
	motion.x = speed
	motion = move_and_slide(motion)
	#print("actual: ", actualPosition)
	#print("previous: ", previousPosition)
	
	
	if previousPosition.x == actualPosition.x:
		speed = speed * -1
		directionFlag = !directionFlag
		
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
	