extends Control

func _process(delta: float) -> void:
	
	$TileMap.position = get_window().size / 2
	$TileMap.scale = Vector2(get_window().size.x + get_window().size.y / 2, get_window().size.y + get_window().size.x / 2) / 110
	$Buttons.position = get_window().size / 2
	$Buttons.scale = Vector2(get_window().size.x + get_window().size.y / 2, get_window().size.y + get_window().size.x / 2) / 1900
	if $Buttons/LVL1.button_pressed:
		get_tree().change_scene_to_file("res://level_1.tscn")
	elif $Buttons/LVL2.button_pressed:
		get_tree().change_scene_to_file("res://level_2.tscn")
