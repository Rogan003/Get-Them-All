extends RigidBody2D

export var speed = 600 
var screen_size
var target = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
func start(pos):
	position = pos
	target = pos
	show()
	
# Change the target whenever a touch event happens.
func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		target = event.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	# Move towards the target and stop when close.
	if position.distance_to(target) > 10:
		velocity = target - position

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	
