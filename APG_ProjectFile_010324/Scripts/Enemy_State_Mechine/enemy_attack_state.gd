extends Enemy_States
class_name Enemy_Attack_State

@export var enemy = CharacterBody2D
@export var hitbox = CollisionShape2D
@onready var animation := $"../../AnimationPlayer"
@export var attack_speed = 10
@export var attack_time = 10

var animation_end = false

func Enter():
	print("Attack")
	enemy.velocity = Vector2(0, enemy.velocity.y)
	animation.play("enemy_animation_test")

func Update(delta):
	if !animation.is_playing():
		Transitioned.emit(self, "Enemy_Idel_State")

func Physic_Update(delta):
	pass

func Exit():
	pass
