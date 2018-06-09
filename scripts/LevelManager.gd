extends Node

var SCENE_PATH = "res://scenes/"
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func change_scene(sceneName):
	call_deferred("_deffered_change_scene", sceneName)

func _ready():
	pass

func _deffered_change_scene(sceneName):
	var path = SCENE_PATH + sceneName + ".tscn"
	var root = get_tree().get_root()
	var current = root.get_child(root.get_child_count() - 1)
	current.free()
	var sceneResource = ResourceLoader(path)
	var newScene = sceneResource.instance()
	get_tree().get_root().add_child(newScene)
	get_tree().set_current_scene(newScene)
