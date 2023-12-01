extends Node2D
var child
var currentlevel = 0
var levels = ["startscreen","tutorial1","tutorial2","tutorial3","level1","level2","level3","level4","level5","level6","level7"]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_next_level():
	self.get_node(levels[currentlevel]).call_deferred("free")
	currentlevel+=1
	var scene = load("res://levels/"+levels[currentlevel]+".tscn")
	scene = scene.instantiate()
	self.call_deferred("add_child", scene)

func load_control_menu():
	var scene = preload("res://scenes/controlsscene.tscn")
	self.get_node("startscreen").call_deferred("free")
	scene = scene.instantiate()
	self.call_deferred("add_child", scene)

func load_main_menu():
	var scene = preload("res://scenes/startscreen.tscn")
	self.get_node("controlsscene").call_deferred("free")
	scene = scene.instantiate()
	self.call_deferred("add_child", scene)
