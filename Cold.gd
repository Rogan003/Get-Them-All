extends Area2D
signal start_timer2


var screen_size
var rng = RandomNumberGenerator.new()
var ply


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()
	$CollisionShape2D.disabled = true
	
	
func start():
	rng.randomize()
	var rndX = rng.randi_range(0, screen_size.x)
	var rndY = rng.randi_range(0, screen_size.y)
	if rndY > 430:
		rndY = 430
	position = Vector2(rndX, rndY)
	show()
	$CollisionShape2D.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Cold_body_entered(body):
	body.speed /= 2
	ply = body
	hide()
	$Timer1.start()
	emit_signal("start_timer2")
	$CollisionShape2D.set_deferred("disabled", true)


func _on_Timer1_timeout():
	ply.speed *= 2


func _on_Timer2_timeout():
	rng.randomize()
	var rndX = rng.randi_range(0, screen_size.x)
	var rndY = rng.randi_range(0, screen_size.y)
	if rndY > 430:
		rndY = 430
	position = Vector2(rndX, rndY)
	$CollisionShape2D.set_deferred("disabled", false)
	show()
