extends KinematicBody2D

const GRAVITY = 0.1
const JUMP_HEIGHT = -200

var somsiadThink
var speed = 30000
var previousPosition = Vector2()
var motion = Vector2()
var directionFlag = true
var allowedWalls = ["Wall", "Wall1", "Wall2", "Door", "Door1", "Door2", "ExitDoor", "ExitDoor1", "RoofDoor", "RoofDoor1", "ExitDoorExit"]
var allowedDoorsUp = ["Door", "Door1", "Door2", "ExitDoor", "ExitDoor1", "ExitDoorExit", "ExitDoorExit1"]
var allowedDoorsDown = ["Door", "Door1", "Door2", "RoofDoor", "RoofDoor1"]

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
			if isAllowedWall(colider.get_name()):
				directionFlag = !directionFlag
				speed = speed * -1
				
			if isAllowedUp(colider.get_name()) and somsiadThink > 60:
				self.set_pos(get_pos() + Vector2(0, -1800))
			
			if isAllowedDown(colider.get_name()) and somsiadThink < 60:
				self.set_pos(get_pos() + Vector2(0, 1800))
			
			if colider.get_name() == "Player":
				var player = colider
				player.die()
				
		
	if directionFlag:
		animitedSprite.play("Left")
	else:
		animitedSprite.play("Right")
		
	previousPosition = actualPosition

func isAllowedWall(colliderName):
	for name in allowedWalls:
		if name == colliderName:
			return true

func isAllowedDown(colliderName):
	for name in allowedDoorsDown:
		if name == colliderName:
			return true
			
func isAllowedUp(colliderName):
	for name in allowedDoorsUp:
		if name == colliderName:
			return true

	
func _ready():
	set_process(true)
	
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	