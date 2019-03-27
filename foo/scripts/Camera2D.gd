extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var player
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	player = get_node("../../player")
	position.x = player.position.x
	position.y = player.position.y+100

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	
	position.x = lerp(position.x,player.position.x,.03)
	#position.y = lerp(position.y,player.position.y-200,.03)
	print(player)
	