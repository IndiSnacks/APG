extends CharacterBody2D

@export var sprite = Sprite2D

func _physics_process(delta):
	move_and_slide()
	
	if velocity.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
		

