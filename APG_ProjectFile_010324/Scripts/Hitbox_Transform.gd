extends Area2D

@export var sprite = Sprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if sprite.flip_h:
		print("left")
	else:
		print("right")
	
