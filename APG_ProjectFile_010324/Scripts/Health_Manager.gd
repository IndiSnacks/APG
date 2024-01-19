extends Node


var maxHealth = 3
@export var currHealth = 0 

func _ready():
	currHealth = maxHealth
	print(currHealth)

func hurt(amt : int):
	currHealth -= amt
	
	if(currHealth < 0):
		currHealth = 0
	
	print(currHealth)

func heal(amt : int):
	currHealth += amt
	
	if(currHealth > maxHealth):
		currHealth = maxHealth
		
	print(currHealth)
