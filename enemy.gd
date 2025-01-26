extends PathFollow2D

var HP: float = 100 + (G.enempast * 2.3)
var HPS: float = HP
var speed: float = 1 + (G.enempast / 50)
var collT1
var collT2


func _process(delta: float) -> void:
	if HP <= 0:
		queue_free()
		G.money += 2
	elif HP > HPS*0.75:
		$HPColor.color = "00ff00"
	elif HP <=  HPS*0.75 and HP >  HPS*0.5:
		$HPColor.color = "ffff00"
	elif HP <=  HPS*0.5 and HP >  HPS*0.25:
		$HPColor.color = "ff8e00"
	elif HP <=  HPS*0.25 and HPS > 0:
		$HPColor.color = "ff0000"
	$HP.text = str(HP)
	progress += speed
	if collT1 == true:
		HP -= 0.2
	if collT2 == true:
		HP -= 0.4



func _on_enemy_area_exited(area: Area2D) -> void:
	if area.name == "tower":
		queue_free()
	if area.name == "Tzone1":
		collT1 = false
	if area.name == "Tzone2":
		collT2 = false


func _on_enemy_area_entered(area: Area2D) -> void:
	if area.name == "Tzone1":
		collT1 = true
	if area.name == "Tzone2":
		collT2 = true
