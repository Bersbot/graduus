extends CharacterBody2D

const SPEED = 500.0
var dt: float
var Coll: bool = false

func _physics_process(delta: float) -> void:
	if Input.is_key_pressed(KEY_A) and G.pause == false:
		position.x -= SPEED * delta
	if Input.is_key_pressed(KEY_D) and G.pause == false:
		position.x += SPEED * delta
	if Input.is_key_pressed(KEY_W) and G.pause == false:
		position.y -= SPEED * delta
	if Input.is_key_pressed(KEY_S) and G.pause == false:
		position.y += SPEED * delta
	
		
	
	move_and_slide()


func _on_gradus_area_entered(area: Area2D) -> void:
	if area.name == "rime" and Coll == false:
		G.pause = true
		$"../rime/say".text = "Кто ты\nселизень???"
		await get_tree().create_timer(1.5).timeout
		$"../rime/say".text = ""
		$Player.visible = false
		$gradusMOus.visible = true
		$say.text = "Я градус мышь"
		await get_tree().create_timer(1.5).timeout
		$say.text = ""
		$Player.visible = true
		$gradusMOus.visible = false
		$"../rime/say".text = "ММММ!\nВкусный лягушачий лапка\nЛезь в кормай"
		await get_tree().create_timer(1.5).timeout
		$"../rime/say".text = ""
		$"../Path2D/PathFollow2D".visible = true
		$Player.visible = false
		$say.text = "НО я мииииииишь"
		$"../Path2D/PathFollow2D".progress = 0.1
		var i = 0
		while i < 100:
			$"../Path2D/PathFollow2D".progress += 3
			await get_tree().create_timer(0.01).timeout
			i += 1
		get_tree().change_scene_to_file("res://levels.tscn")
		
