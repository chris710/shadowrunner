extends Node2D

onready var lights = get_node("../../lights").get_children()
onready var casters = get_node("../../casters").get_children()
onready var label = get_node("../../Label")
onready var bar = get_node("../../ProgressBar")
var detected = 0
var detection_distance = 250


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	pass

#func _process(delta):
#	#global_translate(get_local_mouse_position())
##	# Called every frame. Delta is time since last frame.
##	# Update game logic here.
#	for light in lights:
#	#print(self.position.distance_to(lights[0].position))
#	#print(str(lights[0].position))
#	#print("Player: " + str(self.get_global_transform().get_origin()) + " Red: " + str(lights[0].position))
#		if self.get_global_transform().get_origin().distance_to(light.position)<350:
#			if check_caster_occlusion():
#				print("wololo")
			
#	pass

#func check_caster_occlusion():
#	var result = false;
#	for caster in casters:
#		if caster.:
#			result = true
#			break
#	return result

#func _input(event):
	#if event is InputEventMouseMotion:
		#moving = true
#		self.global_position = get_global_mouse_position()
		
    
func _physics_process(delta):
	var space_state = get_viewport().find_world_2d().direct_space_state #get_world().direct_space_state
    # use global coordinates, not local to node
	for light in lights:
		#print("Player: " + str(self.get_global_transform().get_origin()) + " Red: " + str(light.position))
		var distance_to_light = self.get_global_transform().get_origin().distance_to(light.position)
		if distance_to_light < detection_distance:
			var result = space_state.intersect_ray(self.get_global_transform().get_origin(), light.position,[self])
			if result.empty():
				detected+= (abs(distance_to_light-detection_distance))/2.4/detection_distance		#hax lololo
				#label.set_text("Detected: "+str(detected))
				bar.value = detected
#				print("hit at point ", self.get_global_transform().get_origin())
#			else:
#				print("hit at point ", result.position)

	#self.set_applied_force()
	#pass
	
func _integrate_forces(state):
	var lv = state.get_linear_velocity()
	lv = (get_global_mouse_position() - self.global_position) * 16
	state.set_linear_velocity(lv)
	