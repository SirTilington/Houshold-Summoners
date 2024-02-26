extends Node2D

var sink = preload("res://Charachters/Objects/Sink/sink.tscn")
var calendar = preload("res://Charachters/Objects/Calender/calendar.tscn")
var tire = preload("res://Charachters/Objects/Tire/tire.tscn")
var iron = preload("res://Charachters/Objects/Iron/iron.tscn")

func _on_sink_button_pressed():
	GameLogic.player1Objects.append(sink.instantiate())

func _on_start_button_pressed():
	GameLogic.getReady()
	get_tree().change_scene_to_file("res://main.tscn")

func _on_calendar_button_pressed():
	GameLogic.player1Objects.append(calendar.instantiate())

func _on_texture_button_pressed():
	GameLogic.player1Objects.append(tire.instantiate())
	
func _on_iron_button_pressed():
	GameLogic.player1Objects.append(iron.instantiate())
