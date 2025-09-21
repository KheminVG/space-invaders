extends Camera2D

const SPEED : int = 100
const scroll_direction : Vector2 = Vector2(0, -1)

const reset_threshold : float = 1000000.0

func _process(delta: float) -> void:
	var velocity : Vector2 = self.scroll_direction * self.SPEED
	self.translate(velocity * delta)
	
	if abs(self.position.y) > reset_threshold:
		var offset = self.position
		
		for node in get_tree().get_nodes_in_group("world_objects"):
			node.position -= offset
