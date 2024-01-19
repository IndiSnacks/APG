extends Enemy_States
class_name Enemy_Idel_State

@export var enemy : CharacterBody2D
@export var move_speed := 500

var player : CharacterBody2D
var move_direction 
var wander_time
var distance

func randomize_wander():
	move_direction = randf_range(-1,1)
	wander_time = randf_range(1,3)

func Enter():
	player = get_tree().get_first_node_in_group("player")
	randomize_wander()

func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func Physics_Update(delta: float):
	distance = player.global_position - enemy.global_position
	
	if enemy:
		enemy.velocity.x = move_direction * move_speed
	
	if distance.length() < 700:
		Transitioned.emit(self, "Enemy_Follow_State")

func Exit():
	pass
