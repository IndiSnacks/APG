extends Node2D
class_name Health

@export var maxHealth = 15
@export var currHealth = 0
@export var healthBar: ProgressBar

func set_health(amt: int):
	maxHealth = amt

func _ready():
	currHealth = maxHealth
	healthBar.value = currHealth
	healthBar.max_value = maxHealth

func _on_hurtbox_area_entered(area):
	if area.is_in_group("bullet"):
		currHealth += -(area.damageValue)
		healthBar.value = currHealth

func _process(_delta):
	if healthBar.value == 0:
		owner.queue_free()
