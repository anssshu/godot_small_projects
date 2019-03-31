extends Node2D
const scroll = 500
var level = 0
var levels = 5

func _ready():
	
	#$ScrollContainer.value = .5
	#connect all the levels to differnet functions
	$ScrollContainer/HBoxContainer/level1.connect("button_down",self,"on_level1")
	$ScrollContainer/HBoxContainer/level2.connect("button_down",self,"on_level2")
	$ScrollContainer/HBoxContainer/back.connect("button_down",self,"on_back")
	
	for i in range(globals.cleared_levels+1):
		get_node("ScrollContainer/HBoxContainer/level"+str(i+1)+"/Sprite").visible = false

func _process(delta):
	#$ScrollContainer.scroll_horizontal
	var h = $ScrollContainer.get_h_scrollbar()
	
	if Input.is_action_just_pressed("ui_left"):
		if level < levels+1 and level > 0 :
			level = level -1
			if level <3:
				h.value -= scroll
	if Input.is_action_just_pressed("ui_right"):
		if level > -1 and level < levels :
			level = level + 1
			if level > 2:
				h.value +=scroll
	if level != 0:
		get_node("ScrollContainer/HBoxContainer/level"+str(level)).grab_focus()
	else:
		get_node("ScrollContainer/HBoxContainer/back").grab_focus()
func on_level1():
	print("level1")
	get_tree().change_scene("res://scenes/main.tscn")
	
func on_level2():
	print("level2")
	get_tree().change_scene("res://scenes/end.tscn")
	
func on_back():
	get_tree().change_scene("res://scenes/start.tscn")