extends Node2D

@export var progressbar : ProgressBar
@export var player: CharacterBody2D
@export var x_launch_amt = 30000
@export var y_launch_amt = 1000

func _process(_delta):
	progressbar.value = HealthManager.currHealth

func _on_hurtbox_area_entered(area):
	
	if area.is_in_group("buff"):
		launch()
		
	if area.is_in_group("enemy"):
		HealthManager.hurt(area.damageValue)
		HealthManager.heal(area.healValue)

func launch():
	var norm = player.get_wall_normal()
	var direction = Vector2(norm.x * x_launch_amt, -y_launch_amt)
	player.velocity = direction
	print(norm.x)
	print(x_launch_amt)
	print(direction)
