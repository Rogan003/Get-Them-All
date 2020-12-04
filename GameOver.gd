extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Play_pressed():
	$ButtonSound.play()
	get_tree().change_scene("res://PickGame.tscn")


func _on_Main_Menu_pressed():
	$ButtonSound.play()
	get_tree().change_scene("res://MainMenu.tscn")
