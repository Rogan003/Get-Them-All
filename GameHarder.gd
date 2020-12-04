extends Node


# Declare member variables here. Examples:
var pom
var rng = RandomNumberGenerator.new()
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = $Main/Player.screen_size
	$Teleport1.start()
	$Teleport2.start()
	$Hot.start()
	$Cold.start()
	pom = randi() % 2 + 1
	if pom == 1:
		$Hot.hide()
		$Hot.set_deferred("disabled", true)
	else:
		$Cold.hide()
		$Cold.set_deferred("disabled", true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Teleport1_body_entered(body):
	body.position = $Teleport2.position
	$TimerTP.start()
	$Teleport1/CollisionShape2D.set_deferred("disabled", true)
	$Teleport2/CollisionShape2D.set_deferred("disabled", true)
	

func _on_Teleport2_body_entered(body):
	body.position = $Teleport1.position
	$TimerTP.start()
	$Teleport1/CollisionShape2D.set_deferred("disabled", true)
	$Teleport2/CollisionShape2D.set_deferred("disabled", true)


func _on_Timer_timeout():
	$Teleport1/CollisionShape2D.set_deferred("disabled", false)
	$Teleport2/CollisionShape2D.set_deferred("disabled", false)
	
#Ne radi sve, treba jos testirati i podesavati cold i hot
#Treba uvesti kako se pojavljuje jedan od njih na svakih 3 sekunde umesto onog da se oba pojavljuju


func _on_TimerHC_timeout():
	pom = randi() % 2 + 1
	rng.randomize()
	var rndX = rng.randi_range(0, screen_size.x)
	var rndY = rng.randi_range(0, screen_size.y)
	if rndY > 430:
		rndY = 430
	if pom == 1:
		$Hot.position = Vector2(rndX, rndY)
		$Hot/CollisionShape2D.set_deferred("disabled", false)
		$Hot.show()
	else:
		$Cold.position = Vector2(rndX, rndY)
		$Cold/CollisionShape2D.set_deferred("disabled", false)
		$Cold.show()


func _on_Hot_start_timer():
	$TimerHC.start()


func _on_Cold_start_timer2():
	$TimerHC.start()
