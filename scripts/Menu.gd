extends Node

var SCENE_PATH = "res://scenes/"

func _ready():
	get_node("MenuMusic").play("DJ SOMSIAD")
	pass


func _on_NewGameButton_pressed():
	var path = SCENE_PATH + "Game.tscn"
	get_tree().change_scene(path)
	pass # replace with function body
