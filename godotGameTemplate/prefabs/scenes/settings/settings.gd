extends Node2D
var g = 0 
func _ready():
	$menu.connect("button_down",self,"on_click")
	$mute.connect("button_down",self,"on_mute_click")
	$unmute.connect("button_down",self,"on_unmute_click")
	
	

func on_click():
	get_tree().change_scene("res://prefabs/scenes/menu/menu.tscn")
	
func on_mute_click():
	globals.mute = false
	#$unmute.visible = globals.mute
func on_unmute_click():
	globals.mute =  true
	#$mute.visible = !globals.mute
	
func _process(delta):
	$mute.visible = globals.mute
	$mute.disabled = !globals.mute
	
	
	$unmute.visible = !globals.mute
	$unmute.disabled = globals.mute
	
	if Input.is_action_just_pressed("ui_right"):
		g = 0
	if Input.is_action_just_pressed("ui_left"):
		g = 1
		
	if g == 0 :
		$menu.grab_focus()
	if g==1 and $mute.visible:
		$mute.grab_focus()
	if g==1 and $unmute.visible:
		$unmute.grab_focus()
		