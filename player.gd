extends RigidBody2D
var acceleration = 500
var velocity = 70000
var gravity_const = 98
var jump_strength = -2750000
var selection = null

# Called when the node enters the scene tree for the first time.
func _ready():
	self.lock_rotation = true

func handle_jump_grounded():
	var space_state = get_world_2d().direct_space_state
	# use global coordinates, not local to node
	
	var query = PhysicsRayQueryParameters2D.create(Vector2(self.position.x, self.position.y), Vector2(self.position.x, self.position.y+100*$Sprite2D.scale.y),2)
	query.exclude=[self]
	var result = space_state.intersect_ray(query)

	if result:
		return true
	else:
		return false

		
func handle_self_scaling():
	if !selection:
		return

	if Input.is_action_just_pressed("scale up") and (selection.get_node("Sprite2D").scale.x < 4 or "scaleable_tile" in selection.name):
		selection.get_node("Sprite2D").apply_scale(Vector2(2,2)) 
		selection.get_node("CollisionShape2D").apply_scale(Vector2(2,2))
		#selection.get_node("Button").get_node("Sprite2D").apply_scale(Vector2(2,2))
	if Input.is_action_just_pressed("scale down") and selection.get_node("Sprite2D").scale.x > 0.25:
		selection.get_node("Sprite2D").apply_scale(Vector2(0.5,0.5))
		selection.get_node("CollisionShape2D").apply_scale(Vector2(0.5,0.5))
		#selection.get_node("Button").get_node("Sprite2D").apply_scale(Vector2(0.5,0.5))

func handle_self_controls(delta):
	if Input.is_action_pressed("move left"):
		self.apply_force(Vector2(-velocity*delta,0))
		
	if Input.is_action_pressed("move right"):
		self.apply_force(Vector2(velocity*delta,0))
	if Input.is_action_just_pressed("jump") and handle_jump_grounded():
		self.apply_force(Vector2(0,jump_strength*get_physics_process_delta_time()*$Sprite2D.scale.x))
	
	# Reload Scene
	if Input.is_action_just_pressed("reload"):
		var path = self.get_parent().get_path()
		self.get_parent().call_deferred("free")
		path = str(path).split("/")
		path = path[-1]
		var scene = load("res://levels/"+path+".tscn")
		scene = scene.instantiate()
		self.get_parent().get_parent().call_deferred("add_child", scene)





func _process(delta):
	
	handle_self_scaling()
	handle_self_controls(delta)

func select_object(object):
	selection = object


func _on_button_pressed():
	select_object(self)


