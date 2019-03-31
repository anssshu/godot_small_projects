extends Area2D


func _ready():
	self.connect("body_entered",self,"on_picked_up")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_picked_up(o):
	if o.get_class() != "TileMap":
		if globals.keys == 3:
			print("stage completed")
			globals.reset()
			get_tree().change_scene("res://scenes/end.tscn")
		else:
			 print("collect three keys")
	
