extends Node


var score


func round_to_dec(num, dec):
	num = float(num)
	dec = int(dec)
	var sgn = 1
	if num < 0:
			sgn = -1
			num = abs(num)
			pass
	var num_fraction = num - int(num) 
	var num_dec = round(num_fraction * pow(10.0, dec)) / pow(10.0, dec)
	var round_num = sgn*(int(num) + num_dec)
	return round_num
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	$Score.hide()
	randomize()
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Start.text = str(round_to_dec($StartTimer.time_left,3))
	$Time.text = str(round_to_dec($GameTime.time_left,3))


func new_game():
	score = 0
	$Score.text = str(score)
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$Start.show()
	var pom = randi() % 2 + 1
	if pom == 1:
		$Music1.play()
	else:
		$Music2.play()


func _on_StartTimer_timeout():
	$Start.hide()
	$Enemy.start()
	$GameTime.start()
	$Score.show()
	$Time.show()


func _on_Enemy_hit():
	score += 1
	$Score.text = str(score)


func _on_GameTime_timeout():
	$Time.hide()
	get_tree().change_scene("res://GameOver.tscn")
