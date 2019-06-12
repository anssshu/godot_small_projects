extends TileMap

var p = Vector2(2,4)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_cell(p.x,p.y,0)
	
func _process(delta):
	if p.y < 10:
		p.y +=1
	set_cell(p.x,p.y,0)
	if get_cell(p.x,p.y) == -1:
		p.y = p.y+1
		