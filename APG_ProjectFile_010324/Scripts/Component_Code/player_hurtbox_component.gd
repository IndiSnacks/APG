extends Node2D

@export var progressbar : ProgressBar

func _process(_delta):
	progressbar.value = HealthManager.currHealth

func _on_hurtbox_area_entered(area):
	if area.is_in_group("enemy"):
		HealthManager.hurt(area.damageValue)
		HealthManager.heal(area.healValue)
