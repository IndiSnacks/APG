extends CharacterBody2D

@export var sprite = Sprite2D

var direction 

signal facing(facingRight)

func _ready():
	pass

func _physics_process(_delta):
	move_and_slide()
	direction = velocity.normalized().x
	if(direction > 0):
		sprite.flip_h = false
		facing.emit(false)
	else:
		sprite.flip_h = true
		facing.emit(true)
