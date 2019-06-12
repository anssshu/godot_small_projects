extends Control
var pause = false

func _ready():
	$menu.connect("button_down",self,"on_menu")
	$play.connect("button_down",self,"on_play")
	

func _process(delta):	
	if Input.is_action_just_pressed("ui_home"):
		if pause  ==  false :
			pause = true
		else :
			pause = false 
	if pause:
		get_tree().paused = true
		self.visible = true
	else:
		get_tree().paused = false	
		self.visible = false
	# pause ui navigation with game pad
	if Input.is_action_just_pressed("ui_left") :
		$play.grab_focus()
	if Input.is_action_just_pressed("ui_right") :
		$menu.grab_focus() 
func on_menu():
	get_tree().paused = false
	globals.reset()
	get_tree().change_scene("res://prefabs/scenes/menu/menu.tscn")
	
func on_play():
	pause = false