extends RigidBody2D

func _ready() -> void:
	randomize()
	position.x = 1000
	position.y = rand_range(-300, 0)

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
