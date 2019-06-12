extends TextureButton

func _ready():
	self.connect("button_down",self,"on_button_down")
	
func on_button_down():
	#print("paused")
	get_node("../pause_menu").pause = true
