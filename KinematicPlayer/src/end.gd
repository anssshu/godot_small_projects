extends Node2D

var mplayer = AudioStreamPlayer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(mplayer)
	$player.GRAVITY = 600
	$player.WALK_SPEED = 250
	$player.JUMP_SPEED = -300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_end") or globals.health == 0:
		
		globals.reset()
		get_tree().reload_current_scene()
	#update hud
	$hud/pickupbar/Label.text = str(globals.score)
	$hud/healthbar/TextureProgress.value = globals.health
	$hud/keysbar/Label.text = str(globals.keys)