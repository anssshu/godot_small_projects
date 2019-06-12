extends Node2D

func _ready():
	$menu.connect("button_down",self,"on_menu")
	$restart.connect("button_down",self,"on_restart")
	
	
	$menu.disabled = true
	$menu.visible = false
	
	$restart.grab_focus()
	
func _process(delta):
	
	if Input.is_action_just_pressed("ui_up"):
		$restart.visible = true
		$restart.disabled = false
		$restart.grab_focus()
		
		$menu.disabled = true
		$menu.visible = false
	if Input.is_action_just_pressed("ui_down"):
		$menu.disabled = false
		$menu.visible = true
		$menu.grab_focus()
		
		$restart.disabled = true
		$restart.visible = false
		
func on_menu():
	
	globals.reset()
	self.visible = false
	get_tree().paused = false
	get_tree().change_scene("res://prefabs/scenes/menu/menu.tscn")
	
func on_restart():
	globals.reset()
	self.visible = false
	get_tree().paused = false
	get_tree().change_scene("res://levels/level1/level1.tscn")