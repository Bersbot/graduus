extends Area2D

var speed = 3000

func  _process(delta: float) -> void:
	position += transform.x * -speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.name == "enemy":
		queue_free()


func _on_area_exited(area: Area2D) -> void:
	if area.name == "zone":
		queue_free()
	pass
