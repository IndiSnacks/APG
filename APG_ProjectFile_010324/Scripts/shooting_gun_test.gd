extends StaticBody2D

@export var bullet : PackedScene
@export var fireRate = 1

var canFire = true

func _physics_process(_delta):
	if canFire:
		fire()
		canFire = false
		await(get_tree().create_timer(fireRate).timeout)
		canFire = true


func fire():
	var b = bullet.instantiate()
	owner.add_child(b)
	b.transform = $bulletPoint.global_transform
