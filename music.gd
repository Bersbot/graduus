extends AudioStreamPlayer2D


func _on_finished() -> void:
	playing = true

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_1):
		volume_db -= 0.5
	if Input.is_key_pressed(KEY_2):
		volume_db += 0.5
