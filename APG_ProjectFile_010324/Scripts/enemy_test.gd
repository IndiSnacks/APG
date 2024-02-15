extends CharacterBody2D

var s

func _ready():
	s = scale.x

func _physics_process(_delta):
	move_and_slide()
	if velocity.x < 0:
		scale.x = s
	elif velocity.x >= 0:
		scale.x = -s

