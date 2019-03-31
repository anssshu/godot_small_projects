#-------------------------------------------code for rigid body character-----------------------------------------------------------
extends RigidBody2D

#------------------------------------------declare the class variables--------------------
export var accn = 100
var jump_speed = 1600
var top_speed = 800
var on_ground = false



var state_machine = {
	idle = "idle",
	left = "left",
	right = "right",
	jump = "jump"
}

var current_state = self.state_machine.idle
var previous_state =  self.state_machine.jump

var move = {
	left = Vector2(-1,0),
	right = Vector2(1,0),
	up = Vector2(0,-1),
	down = Vector2(0,1)
}
var final_velocity = Vector2(0,0)
var n = Vector2(0,-1) #initialise the collision normal

#for movement on curve and plane surface


#-------------------------------------------initialize object----------------------
func _ready():
	
	# on_begin_contact
	self.connect("body_entered",self,"on_begin_contact")
#-------------------------------------------------------------------

#-----------------------------------------update object logic on each frame-------------------------------------	
func _integrate_forces(state):
	
	# 1 calculate  the collision normal 
	self.calculate_collision_normal(state)
	
	
	# 2  set the ray cast direction		
	$RayCast2D.set("cast_to",-50*self.n)      
	
		
	# 3 determine if the object is on the ground or not
	self.determine_object_on_ground()
	
	
	# 4 calculate player states
	self.calculate_state_transition()
	
	# 5 calculate final player movements
	self.calculate_player_movements(state)
	
	# 6 update state logic
	self.update_state_logic()
#---------------------------------------------helper methods -----------------------------------------------------------------------------		
 # calculate  the collision normal 	
func calculate_collision_normal(state):
	if state.get_contact_count()>0 :
		if state.get_contact_collider_object(0).get_class() == "StaticBody2D" :
			self.n = state.get_contact_local_normal(0) #calculate the collision normal
	else:
		self.n = Vector2(0,-1)

#-------------------------------------------------------------------------------------------------------------------------------------
# check whether the object is on the ground or not
func determine_object_on_ground():
	if $RayCast2D.is_colliding():
		self.on_ground = true
		
	else :
		self.on_ground = false

#------------------------------------------------------------------------------------------------------
#calculate state transition
func calculate_state_transition():
	#store the current state
	var c = current_state
	
	#logic for state transition
	if Input.is_action_pressed("ui_left"):
		self.current_state = self.state_machine.left
	
	elif Input.is_action_pressed("ui_right"):
		self.current_state = self.state_machine.right
		
	elif self.on_ground == false :
		self.current_state = self.state_machine.jump	
		
	else :
		self.current_state = self.state_machine.idle
		
	#if the current state has changed from the stored value update previous state
	if c!=current_state:
		previous_state = c
		
		
	
#------------------------------------------------------------------------------------------------------------
#calculate player movements
func calculate_player_movements(state):
	var v= state.linear_velocity  # save the linear velocity
	var t = n.rotated(PI/2)
	
	
	if Input.is_action_pressed("ui_left") and abs(t.dot(v))<top_speed :
		final_velocity  =  self.n.rotated(-PI/2)*accn
		state.linear_velocity = state.linear_velocity+final_velocity
		
	if Input.is_action_pressed("ui_right") and abs(t.dot(v))<top_speed :
		final_velocity = self.n.rotated(PI/2)*accn
		state.linear_velocity = state.linear_velocity+final_velocity
		
	if Input.is_action_pressed("ui_down"):
		#self.set_deferred("mode",0)
		pass
		
	if Input.is_action_just_pressed("ui_up") and  on_ground:
		final_velocity = move.up*jump_speed
		state.linear_velocity = state.linear_velocity+final_velocity
		
	if Input.is_action_just_pressed("ui_jump")  and on_ground:
		final_velocity = move.up*jump_speed*1.5
		state.linear_velocity = state.linear_velocity+final_velocity

#-----------------------------------------------------------------------------------------------------------------------
#update animation
func update_state_logic():
	if self.current_state == "left":
		$Sprite.flip_v = true		
	if self.current_state == "right":
		$Sprite.flip_v = false


#------------------------------------------------------------------------------------------------------------
#collision code for the player 
func on_begin_contact(obj):
	# if player collides with the chicken
	print(obj)


#--------------------------------------------------------------------------------------------------------------

