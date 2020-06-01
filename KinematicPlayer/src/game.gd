extends Node2D

var mplayer = AudioStreamPlayer.new()
var bg_musicplayer = AudioStreamPlayer.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	var bg_music = preload("res://assets/bush_baby.wav")
	var pickup =  preload("res://objects/pickup.tscn")
	add_child(mplayer)
	add_child(bg_musicplayer)
	bg_musicplayer.stream = bg_music
	bg_musicplayer.volume_db=-1.0
	if globals.mute == false:
		bg_musicplayer.play()
	
	#put pickups in the scene
	for i in range(15):
		var p = pickup.instance()
		p.position.x = i*200 +800
		p.position.y = 400 -rand_range(0,300)
		self.add_child(p)
		
	#add a node to display score 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#game over logic
	if  globals.life == 0:
		pass
	
	$hud/pickupbar/Label.text = str(globals.score)
	$hud/healthbar/TextureProgress.value = globals.health
	$hud/keysbar/Label.text = str(globals.keys)
