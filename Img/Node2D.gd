extends Node2D

var sp = Sprite.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	var imgFile = "res://icon.png"
	var img = Image.new()
	var itex = ImageTexture.new()
	img.load(imgFile)
	itex.create_from_image(img)
	
	sp.texture = itex
	
	self.add_child(sp)
	sp.position.x = 400
	sp.position.y = get_viewport().get_visible_rect().size.y/2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sp.rotate(PI/60)
