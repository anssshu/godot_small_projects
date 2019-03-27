extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var accn = 100
var jump_speed = 900
var top_speed = 450
var move = {
	left = Vector2(-1,0),
	right = Vector2(1,0),
	up = Vector2(0,-1),
	down = Vector2(0,1)
}
var final_velocity = Vector2(0,0)
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass

func _physics_process(delta):
	pass
	
func _integrate_forces(state):
	#print(state.get_contact_local_normal(0))
	var v= state.linear_velocity
	if Input.is_action_pressed("ui_left") and abs(v.x)<top_speed:
		final_velocity  =  move.left*accn
		state.linear_velocity = state.linear_velocity+final_velocity
		
	if Input.is_action_pressed("ui_right") and abs(v.x)<top_speed:
		final_velocity = move.right*accn
		state.linear_velocity = state.linear_velocity+final_velocity
		
	if Input.is_action_pressed("ui_down"):
		pass
		
	if Input.is_action_just_pressed("ui_up") and abs(v.y)<5:
		final_velocity = move.up*jump_speed
		state.linear_velocity = state.linear_velocity+final_velocity
	if Input.is_action_just_pressed("ui_jump")  and abs(v.y)<50:
		final_velocity = move.up*jump_speed*1.5
		state.linear_velocity = state.linear_velocity+final_velocity
		
	
		