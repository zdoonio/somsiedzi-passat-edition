extends AnimatedSprite

func _process(delta):
	
	if Input.is_action_pressed("right"):
		play("Run_Right")
	elif Input.is_action_pressed("left"):
		play("Run_Left")
	else: 
		play("Idle")


func _ready():
	set_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass