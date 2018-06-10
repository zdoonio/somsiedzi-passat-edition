extends Node

var SCENE_PATH = "res://scenes/"

func _process(delta):
	if Input.is_action_pressed("esc"):
		var path = SCENE_PATH + "Menu.tscn"
		get_tree().change_scene(path)
		

func _ready():
	set_process(true)
	get_node("Music").play("DJ SOMSIAD")
	get_node("Timer1").start()
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Timer1_timeout():
	get_node("AnimatedSprite").play("Intro2")
	get_node("Timer1").stop()
	get_node("Timer2").start()
	pass # replace with function body


func _on_Timer2_timeout():
	get_node("AnimatedSprite").play("Intro3")
	get_node("Timer2").stop()
	get_node("Timer3").start()
	pass # replace with function body


func _on_Timer3_timeout():
	var path = SCENE_PATH + "Menu.tscn"
	get_tree().change_scene(path)
	pass # replace with function body
