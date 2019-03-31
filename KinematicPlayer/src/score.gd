extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "SCORE:" + str(globals.score)
	
func _process(delta):
	#update the score  always
	self.text = "SCORE:" + str(globals.score)