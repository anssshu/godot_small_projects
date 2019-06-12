#this script is for storing the global values 
# all global values declared in this file can be accessed from any script

extends Node

var score = 0 
var health = 100
var life = 3
var keys = 0
var mute =  false
var cleared_levels = 1 #0,1,2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func reset():
	globals.keys = 0
	globals.health = 100
	globals.score = 0
	globals.life = 3