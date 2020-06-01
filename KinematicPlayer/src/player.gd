extends KinematicBody2D
var speedScale = 1.0
var GRAVITY = 1200.0 * speedScale
var WALK_SPEED = 500*speedScale
var JUMP_SPEED = -600*speedScale
var velocity = Vector2()
var n = Vector2(0,-1)
signal my_signal(col)
var on_ground = false


func _ready():
	#connect my_signal for collision detection
	self.connect("my_signal",self,"on_collision")
	#initialize connection for collision detection

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	
	#check for collision
	var c = move_and_collide(velocity*delta) #it holds collision data
	if c:
		emit_signal("my_signal",c)
		#calculate collision normal
		n = c.normal
		
		
		#print("collision:",c)
	else:
		n=Vector2(0,-1)
		
	#determine object is on ground or not on the basis of ray collision
	if self.is_on_floor():
		on_ground = true
	else:
		on_ground = false
	
	
	#calculate state transition
	
	
	#calculate motion
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0
		
			
	if Input.is_action_just_pressed("ui_select") and self.on_ground:
		velocity.y = JUMP_SPEED
		if globals.mute == false:
			$AudioStreamPlayer.play()
	if self.on_ground and velocity.y > 200:
		velocity.y = 0
		
	
	move_and_slide(velocity, n)
	
	
	# update state logic
	
func on_collision(c):
	#print(c.normal)	
	pass
