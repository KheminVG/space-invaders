extends ParallaxBackground

@export var scrolling_speed : int = 40

func _process(delta: float) -> void:
	self.scroll_offset.y -= self.scrolling_speed * delta
