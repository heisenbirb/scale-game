extends CharacterBody2D

@export var StartPos = Vector2(0,0)
@export var PoweredPos = Vector2(0,0)
var currentpower = false
@export var speed = 3

func _ready():
	# If not assigned manually, make it the given transform at the start
	if StartPos == Vector2(0,0):
		StartPos = self.position

func _process(delta):
	if currentpower:
		
		if Vector2(snapped(self.position.x,10),snapped(self.position.y,10)) != Vector2(snapped(PoweredPos.x,10),snapped(PoweredPos.y,10)):
			self.position.x += (PoweredPos.x-StartPos.x)/speed*delta
			self.position.y += (PoweredPos.y-StartPos.y)/speed*delta
		else:
			self.position = self.PoweredPos
	if !currentpower:
		if Vector2(snapped(self.position.x,10),snapped(self.position.y,10)) != Vector2(snapped(StartPos.x,10),snapped(StartPos.y,10)):
			self.position.x += (StartPos.x-PoweredPos.x)/speed*delta
			self.position.y += (StartPos.y-PoweredPos.y)/speed*delta
		else:
			self.position = self.StartPos

	

func on_powered(power):
	currentpower = power
