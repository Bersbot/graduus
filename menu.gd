extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(float) -> void:
	$MenuBackGround.scale = Vector2(get_window().size.x + get_window().size.y / 2, get_window().size.y + get_window().size.x / 2) / 2500
	$MenuBackGround.position = Vector2(get_window().size.x / 2, get_window().size.y / 7 * 4)
	if $MenuBackGround/playButtonColor/play.button_pressed:
		$MenuBackGround/playButtonColor.color = Color(1, 1, 0)
		get_tree().change_scene_to_file("res://startScene.tscn")
	else:
		$MenuBackGround/playButtonColor.color = Color(0, 0, 1)
		
	if $MenuBackGround/exitButtonColor/exit.button_pressed:
		$MenuBackGround/exitButtonColor.color = Color(1, 1, 0)
		get_tree().quit()
	else:
		$MenuBackGround/exitButtonColor.color = Color(0, 0, 1)
