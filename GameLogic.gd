extends Node2D

var player1Objects = []
var player2Objects = []

func getReady():
	for i in player1Objects:
		i.player = 1
	for i in player2Objects:
		i.player = 2

func getTargetfromPlayer1() -> Node:
	for i in player1Objects:
		if i.priorityTarget:
			return i
	return player1Objects.pick_random()
	
func getTargetfromPlayer2() -> Node:
	for i in player2Objects:
		if i.priorityTarget:
			return i
	return player2Objects.pick_random()
	
func checkWinner() -> void:
	if player1Objects.is_empty():
		get_tree().change_scene_to_file("res://player2Victory.tscn")
	if player2Objects.is_empty():
		get_tree().change_scene_to_file("res://player1Victory.tscn")
