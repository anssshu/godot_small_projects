extends Node2D

func _process(delta):
	
	if globals.life == 3:
		$heart.visible = true
		$heart2.visible = true
		$heart3.visible = true
	if globals.life == 2:
		$heart.visible = false
		$heart2.visible = true
		$heart3.visible = true
	if globals.life == 1:
		$heart.visible = false
		$heart2.visible = false
		$heart3.visible = true
	if globals.life == 0:
		$heart.visible = false
		$heart2.visible = false
		$heart3.visible = false
		#game over logic
		get_tree().change_scene("res://prefabs/scenes/gameover/gameover.tscn")