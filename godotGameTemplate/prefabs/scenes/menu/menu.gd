extends Control

var g =3

# Called when the node enters the scene tree for the first time.
func _ready():
	$settings.grab_focus()
	#preload("res://scenes/main.tscn")
	$play.connect("button_down",self,"on_play")
	$levels.connect("button_down",self,"on_levels")
	$settings.connect("button_down",self,"on_settings")
	$exit.connect("button_down",self,"on_exit")
func _process(delta):
	
	if Input.is_action_just_pressed("ui_up") and (g > -1 and g < 3):
		g = g+1	
	if Input.is_action_just_pressed("ui_down") and (g > 0 and g < 4):
		g = g-1	
	if g== 3:
		$play.grab_focus()
	if g == 2 :
		$levels.grab_focus()
	if g == 1 :
		$settings.grab_focus()
	if g == 0 :
		$exit.grab_focus()
		
func on_play():
	get_tree().change_scene("res://levels/level1/level1.tscn")
func on_levels():
	print("load levels")
	get_tree().change_scene("res://prefabs/scenes/levels/levels.tscn")
func on_settings():
	get_tree().change_scene("res://prefabs/scenes/settings/settings.tscn")
	
func on_exit():
	get_tree().quit()