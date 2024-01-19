'''
func _on_buttlet_te(body):
	print(body.name)
	print(body.is_in_group())
	if body.is_in_group("solidObject"):
		print("hit")
		body.queue_free()
	queue_free()
'''
extends Area2D

@export var speed = 2000
@export var damageValue = 0
@export var healValue = 1

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		queue_free()


	if body.is_in_group("solidObject"):
		queue_free()

