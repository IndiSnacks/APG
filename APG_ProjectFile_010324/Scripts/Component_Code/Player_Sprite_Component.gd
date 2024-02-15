#Handles Sprite Transformation for player Chararters
extends Node2D

@export var player : CharacterBody2D
@export var sprite : Sprite2D

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player.velocity.x < 0:		sprite.flip_h = true
	elif player.velocity.x > 0:
		sprite.flip_h = false 
		
