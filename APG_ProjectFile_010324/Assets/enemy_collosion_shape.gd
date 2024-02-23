extends CollisionShape2D

@export var left = Vector2(0,0)
@export var right = Vector2(0,0)

func _on_buff_enemy_facing(facingRight):

	if(facingRight):
		position = left
	if(!facingRight):
		position = right
		
