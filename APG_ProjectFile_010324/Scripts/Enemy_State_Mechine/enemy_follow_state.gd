extends Enemy_States
class_name Enemy_Follow_State

@export var enemy : CharacterBody2D
@export var move_speed := 1300
@export var max_vision_range = 20000
@export var attack_range = 300

var player: CharacterBody2D
var distance
var move_direction 

func Enter():
	print("Follow")
	player = get_tree().get_first_node_in_group("player")

func Update(_delta):
	pass

func Physics_Update(_delta):
	distance = player.global_position - enemy.global_position
	move_direction = distance.normalized().x
	
	enemy.velocity.x = move_speed * move_direction
	
	if distance.length() > max_vision_range:
		Transitioned.emit(self, "Enemy_Idel_State")
	
	if distance.length() < 300:
		Transitioned.emit(self, "Enemy_Attack_State")

func Exit():
	pass
