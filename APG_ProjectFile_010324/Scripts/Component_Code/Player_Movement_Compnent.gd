extends Node2D

@export var player : CharacterBody2D

@export var acceleration = 0.25
@export var speed = 1200
@export var JumpSpeed = -1500
@export var friction = 0.5
@export var gravity = 3500
@export var dashCooldown = 0.5

var canDash = true
var canDoubleJump = true
var dir
var dashCoolDownTimeLeft = dashCooldown

func _ready():
	pass
	$DashCoolDownUI.max_value = dashCooldown
	
func _physics_process(delta):
	player.velocity.y += gravity * delta
	move()
	player.move_and_slide()
	jump()
	dash()
	dashUI()

func jump():
	if Input.is_action_just_pressed("jump"):
		if player.is_on_floor():
			canDoubleJump = true
			player.velocity.y = JumpSpeed
		elif player.is_on_wall():
			player.velocity.y = JumpSpeed 
			player.velocity.x = player.velocity.x + (5000 * -dir)
		elif canDoubleJump:
			canDoubleJump = false
			player.velocity.y = JumpSpeed
	
	if Input.is_action_just_released("jump"):
		player.velocity.y = 0

func dashUI():
	$DashCoolDownUI.value = $DashCoolDownTimer.time_left

func _on_dash_cool_down_timer_timeout():
	canDash = true

func dash():
	if Input.is_action_just_pressed("dash")  && canDash:
		if player.is_on_floor():
			player.velocity.x = player.velocity.x + 4000 * dir
		else:
			player.velocity.x = player.velocity.x + 6000 * dir
		canDash = false
		$DashCoolDownTimer.start(dashCooldown)

func move():
	dir = Input.get_axis("moveLeft", "moveRight")
	 
	if dir != 0: 
		player.velocity.x = lerp(player.velocity.x, dir * speed, acceleration)
	else:
		player.velocity.x = lerp(player.velocity.x, 0.0, friction)


#Test

