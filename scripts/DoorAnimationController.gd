extends AnimatedSprite

func _process(delta):
	if Input.is_action_pressed("up"):
		play("Open")
	else:
		play("Idle")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
