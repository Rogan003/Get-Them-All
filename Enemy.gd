extends Area2D
signal hit

var screen_size
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()
	$CollisionShape2D.disabled = true
	
func start():
	rng.randomize()
	var rndX = rng.randi_range(0, screen_size.x)
	var rndY = rng.randi_range(0, screen_size.y)
	position = Vector2(rndX, rndY)
	show()
	$CollisionShape2D.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Enemy_body_entered(body):
	rng.randomize()
	var rndX = rng.randi_range(0, screen_size.x)
	var rndY = rng.randi_range(0, screen_size.y)
	position = Vector2(rndX, rndY)
	emit_signal("hit")
	#Ne radi ponasa se kao da nikad ne udje u telo igrac, isto radi i u game
	#$CollisionShape2D.set_deferred("disabled", true) ne sad vec kad se zavrsi igra
