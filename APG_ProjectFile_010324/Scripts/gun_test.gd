extends StaticBody2D

@export var bullet : PackedScene
@export var fireRate = 0.25

var canFire = true

func _physics_process(_delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("fire") && canFire:
		fire()
		canFire = false
		await(get_tree().create_timer(fireRate).timeout)
		canFire = true

func fire():
	var b = bullet.instantiate()
	owner.owner.add_child(b)
	b.transform = $bulletPoint.global_transform

	
	
