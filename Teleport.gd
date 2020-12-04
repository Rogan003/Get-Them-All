extends Area2D
#signal enter

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
	if rndY > 430:
		rndY = 430
	position = Vector2(rndX, rndY)
	show()
	$CollisionShape2D.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

