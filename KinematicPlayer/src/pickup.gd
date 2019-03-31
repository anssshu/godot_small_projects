extends Area2D

var pickup_sound = load("res://assets/success.wav")
func _ready():
	self.connect("body_entered",self,"on_picked_up")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_picked_up(o):
	if o.get_class() != "TileMap":
		globals.score +=1
		print("I am pickup by:",o.name)
		var pl = get_tree().get_root().get_node("root").mplayer
		pl.stream = pickup_sound
		if globals.mute == false :
			pl.play()
		queue_free()
