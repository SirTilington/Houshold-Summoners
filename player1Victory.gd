extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_button_pressed():
	GameLogic.player1Objects.clear()
	GameLogic.player2Objects.clear()
	GameLogic.player1Finished = false
	GameLogic.hotseat = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
