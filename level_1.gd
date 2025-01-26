extends Node2D

var HP: float = 100 + 12
var money = 10
var enemy = preload("res://enemy.tscn")
var turel1 = preload("res://turel.tscn")
var turel2 = preload("res://turel2.tscn")
var wave: int = 1
var plasment: bool = false
var zonescoll: bool = false
var busy = [false, false, false, false, false, false,
			false, false, false, false, false, false,
			false, false, false, false, false, false,
			false, false, false, false, false, false,
			false, false, false, false, false, false,
			false, false, false, false, false, false,
			false, false, false, false, false, false,
			false, false, false, false, false, false,
			false
			]
var ar
var tur

func _process(delta: float) -> void:
	$mouse.position = get_local_mouse_position()
	$TileMap.scale = Vector2(get_window().size.x + get_window().size.y / 2, get_window().size.y + get_window().size.x / 2) / 350
	$TileMap/labels/Money.text = str(G.money) + " $"
	$TileMap/labels/HP.text = str(HP) + " HP"
	$TileMap/labels/enemyPast.text = "Enemy past: " + str(G.enempast)
	$TileMap/enemys/Timespawn.wait_time = 5 * G.dificulty
	if $TileMap/shop/turel3.button_pressed and plasment == false:
		if pay(int($TileMap/shop/turel3.text)) == true:
			plasment = true
			tur = turel1
	if $TileMap/shop/turel4.button_pressed and plasment == false:
		if pay(int($TileMap/shop/turel4.text)) == true:
			plasment = true
			tur = turel2
	spawnturel(tur, 50)
	if plasment == false:
		tur = 0
	if HP <= 0:
		G.finish = true
		$TileMap/labels/dead.visible = true
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://menu.tscn")
		G.money = 20
		G.enempast = 0
		G.finish = false
		

func spawnturel(turel, num: int) -> void:
	if zonescoll == true:
		for n in num:
			if ar.name == "zone" + str(n) and plasment == true and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) and summonTurel(turel, n) == true:
					plasment = false
			

func spawnEnemyTime() -> void:
	var init = enemy.instantiate()
	$TileMap/Path2D.add_child(init)
	G.enempast += 1

func _on_mouse_area_entered(area: Area2D) -> void:
	ar = area
	zonescoll = true

func _on_mouse_area_exited(area: Area2D) -> void:
	zonescoll = false


func summonTurel(turel , m: int) -> bool:
	var init = turel.instantiate()
	var PN: Node
	
	match m:
		1: PN = $"TileMap/zones/zone1"
		2: PN = $"TileMap/zones/zone2"
		3: PN = $"TileMap/zones/zone3"
		4: PN = $"TileMap/zones/zone4"
		5: PN = $"TileMap/zones/zone5"
		6: PN = $"TileMap/zones/zone6"
		7: PN = $"TileMap/zones/zone7"
		8: PN = $"TileMap/zones/zone8"
		9: PN = $"TileMap/zones/zone9"
		10: PN = $"TileMap/zones/zone10"
		11: PN = $"TileMap/zones/zone11"
		12: PN = $"TileMap/zones/zone12"
		13: PN = $"TileMap/zones/zone13"
		14: PN = $"TileMap/zones/zone14"
		15: PN = $"TileMap/zones/zone15"
		16: PN = $"TileMap/zones/zone16"
		17: PN = $"TileMap/zones/zone17"
		18: PN = $"TileMap/zones/zone18"
		19: PN = $"TileMap/zones/zone19"
		20: PN = $"TileMap/zones/zone20"
		21: PN = $"TileMap/zones/zone21"
		22: PN = $"TileMap/zones/zone22"
		23: PN = $"TileMap/zones/zone23"
		24: PN = $"TileMap/zones/zone24"
		25: PN = $"TileMap/zones/zone25"
		26: PN = $"TileMap/zones/zone26"
		27: PN = $"TileMap/zones/zone27"
		28: PN = $"TileMap/zones/zone28"
		29: PN = $"TileMap/zones/zone29"
		30: PN = $"TileMap/zones/zone30"
		31: PN = $"TileMap/zones/zone31"
		32: PN = $"TileMap/zones/zone32"
		33: PN = $"TileMap/zones/zone33"
		34: PN = $"TileMap/zones/zone34"
		35: PN = $"TileMap/zones/zone35"
		36: PN = $"TileMap/zones/zone36"
		37: PN = $"TileMap/zones/zone37"
		38: PN = $"TileMap/zones/zone38"
		39: PN = $"TileMap/zones/zone39"
		40: PN = $"TileMap/zones/zone40"
		41: PN = $"TileMap/zones/zone41"
		42: PN = $"TileMap/zones/zone42"
		43: PN = $"TileMap/zones/zone43"
		44: PN = $"TileMap/zones/zone44"
		45: PN = $"TileMap/zones/zone45"
		46: PN = $"TileMap/zones/zone46"
		47: PN = $"TileMap/zones/zone47"
		48: PN = $"TileMap/zones/zone48"
		49: PN = $"TileMap/zones/zone49"
	if busy[m-1] == false:
		busy[m-1] = true
		PN.add_child(init)
		return true
	else:
		return false
	
func pay(m: float) -> bool:
	if G.money > 0 and G.money - m >= 0:
		G.money -= m
		return true
	else:
		return false


func _on_tower_area_entered(area: Area2D) -> void:
	HP -= 12
