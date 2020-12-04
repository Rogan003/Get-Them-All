extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	$VBoxContainer/MarginContainer/VBoxContainer/VBoxContainer2/CenterContainer/TextureRect.texture = $VBoxContainer/MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/TextureButton.normal


func _on_TextureButton2_pressed():
	$VBoxContainer/MarginContainer/VBoxContainer/VBoxContainer2/CenterContainer/TextureRect.texture = $VBoxContainer/MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/TextureButton2.normal


func _on_TextureButton3_pressed():
	$VBoxContainer/MarginContainer/VBoxContainer/VBoxContainer2/CenterContainer/TextureRect.texture = $VBoxContainer/MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/TextureButton3.normal


func _on_TextureButton4_pressed():
	$VBoxContainer/MarginContainer/VBoxContainer/VBoxContainer2/CenterContainer/TextureRect.texture = $VBoxContainer/MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/TextureButton4.normal


func _on_TextureButton5_pressed():
	$VBoxContainer/MarginContainer/VBoxContainer/VBoxContainer2/CenterContainer/TextureRect.texture = $VBoxContainer/MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/TextureButton.normal
