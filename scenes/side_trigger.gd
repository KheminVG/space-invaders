extends Area2D

@export var direction : Vector2 = Vector2(1, 0)
@export var distance : int = 980

func _on_body_entered(body: Node2D) -> void:
	body.position += self.direction.normalized() * self.distance
