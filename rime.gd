extends CharacterBody2D


func _physics_process(delta: float) -> void:
	rotate(0.001)
	
	move_and_slide()
