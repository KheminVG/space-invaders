extends Node2D

var projectile_preload : Resource = preload("res://scenes/projectile.tscn")
@export var shooting_direction : Vector2 = Vector2(0, -1)
@export var shooting_force : int = 500

func shoot() -> void:
	var projectile : RigidBody2D = self.projectile_preload.instantiate()
	self.add_child(projectile)
	
	projectile.apply_central_impulse(self.shooting_force * self.shooting_direction)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		self.shoot()
