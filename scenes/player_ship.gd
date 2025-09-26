extends CharacterBody2D
class_name PlayerShip

@export var SPEED : int = 350
const mouse_max_thres : float = 320.0
const mouse_min_thres : float = 24.0

func _physics_process(delta: float) -> void:
	
	var mouse_position : Vector2 = self.get_global_mouse_position()
	var dist_to_cursor : float = self.position.distance_to(mouse_position)
	var direction : Vector2 = (mouse_position - self.position).normalized()
	
	if dist_to_cursor <= self.mouse_min_thres:
		self.velocity = Vector2(0, 0)
	elif dist_to_cursor > self.mouse_min_thres and dist_to_cursor <= self.mouse_max_thres:
		var dist_factor : float = dist_to_cursor/(self.mouse_max_thres - self.mouse_min_thres)
		self.velocity = direction * dist_factor * self.SPEED
	elif dist_to_cursor > self.mouse_max_thres:
		self.velocity = direction * SPEED
	
	self.move_and_slide()
