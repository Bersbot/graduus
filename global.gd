extends Node

var money = 20
var dificulty = 1
var enempast = 0
var dead: bool = false
var finish: bool = false
var pause = false

func _process(delta: float) -> void:
	dificulty = (enempast/3)
	if Input.is_key_pressed(KEY_ESCAPE):
		#get_tree().change_scene_to_file("res://settings.tscn")
		pass

func wait(sec: float):
	await get_tree().create_timer(sec).timeout
