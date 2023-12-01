extends Area2D
@export var rotate = 0
# If powered is true, the piston only activates when powered by a source
# if it is false it is always working
"var speed = 50
@export var powered = false
var currentpower = false
const startpos = self.position

var going_down = true

func _ready():
	# self.positon = below maybe
	self.rotation_degrees = rotate
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(int(self.position.y))
	if !powered or currentpower:
		if going_down:
			self.position.y += speed *delta
		if !going_down:
			print(self.position.y,startpos.y)
			if self.position.y < startpos.y:
				print('here')
				self.position.y = startpos.y
				going_down = true
			elif int(self.position.y) != startpos.y:
				self.position.y -=speed*delta
			# Will not work for horizontal or other orientations
			
			else:
				going_down = true
	
	#print(self.position)
	$StumpSprite.position = startpos

func on_powered(power):
	currentpower = power



func _on_body_entered(body):
	going_down = false
"
