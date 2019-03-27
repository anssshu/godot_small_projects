extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("body_entered",self,"on_body_entered")
func on_body_entered(obj):
	print(obj)	
	obj.apply_impulse(Vector2(),Vector2(1000,-100))
