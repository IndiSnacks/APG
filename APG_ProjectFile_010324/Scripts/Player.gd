extends CharacterBody2D

@export var health = 3
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
	$Player_Movement_Compnent/DashCoolDownUI.max_value = dashCooldown

func _physics_process(delta):
	velocity.y += gravity * delta
	#move()
	#move_and_slide()
	#jump()
	#dash()
	UIController()

#func jump():
#	if Input.is_action_just_pressed("jump"):
#		if is_on_floor():
#			canDoubleJump = true
#			velocity.y = JumpSpeed
#		elif is_on_wall():
#			velocity.y = JumpSpeed 
#			velocity.x = velocity.x + (5000 * -dir)
#		elif canDoubleJump:
#			canDoubleJump = false
#			velocity.y = JumpSpeed
#	
#	if Input.is_action_just_released("jump"):
#		velocity.y = 0
#
#func dash():
#	if Input.is_action_just_pressed("dash")  && canDash:
#		if is_on_floor():
#			velocity.x = velocity.x + 4000 * dir
#		else:
#			velocity.x = velocity.x + 6000 * dir
#		canDash = false
#		$Player_Movement_Compnent/DashCoolDownTimer.start(dashCooldown)
#
#func move():
#	dir = Input.get_axis("moveLeft", "moveRight")
#	 
#	if dir != 0: 
#		velocity.x = lerp(velocity.x, dir * speed, acceleration)
#	else:
#		velocity.x = lerp(velocity.x, 0.0, friction)

#Check if hit by bullet
func _on_hurtbox_area_entered(area):
	if area.is_in_group("enemy"):
		HealthManager.hurt(area.damageValue)
		HealthManager.heal(area.healValue)

func _on_dash_cooldown_timer_timeout():
	canDash = true

#move this into its own UI controller
func UIController():
	$Player_Movement_Compnent/DashCoolDownUI.value = $Player_Movement_Compnent/DashCoolDownTimer.time_left
