extends Area2D
var hit_sound = load("res://assets/wrong_click.wav")
var kill_sound = load("res://assets/kill.wav")
var x0
var span =100
var speed = 3
var dir =1
var y_dir = -1
var y0
var state = "active"
# Called when the node enters the scene tree for the first time.
func _ready():
	x0 = self.position.x
	y0 = self.position.y
	self.connect("body_entered",self,"on_body_entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var delx =  position.x - x0
	var dely = position.y -y0
	#print(del)
	if state == "active":
		if (position.x - x0) <= span and dir ==1 :
			dir =1
		if (position.x - x0) > span:
			dir =-1
		 
		if delx < -span and dir == -1 :
			dir = 1
	move_local_x(dir*speed)
	#when it died
	if state == "dead":
		$Sprite.rotate(.5)
		print(dely)
		#dir = -1
		if dely < -200 and y_dir == -1:
			y_dir = 1
		
		move_local_y(speed*y_dir*4)
		if dely >200:
			queue_free()
	

func on_body_entered(o):
	if o.get_class() != "TileMap":
		var n = o.velocity.normalized()
		if n.y == 1 and not o.on_ground:
			print("walrus:",o.name," killed me")
			state = "dead"
			var pl = get_tree().get_root().get_node("root").mplayer
			pl.stream = kill_sound
			pl.play()
			#queue_free()
		elif state == "active":
			print("walrus:i hit the player")
			o.velocity = Vector2(dir*5000,-400)
			
			if globals.life >0:
				globals.life -=1
				var pl = get_tree().get_root().get_node("root").mplayer
				pl.stream = hit_sound
				pl.play()
			else:
				globals.life = 0
		print(n,o.velocity)