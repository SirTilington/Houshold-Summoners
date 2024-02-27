extends Node2D

var pointsSpend = 0
var pointsMax = 10

var redFrame = Sprite2D.new()
var redFramePNG = preload("res://selectFrame.png")

var sink = preload("res://Charachters/Objects/Sink/sink.tscn").instantiate()
var sinkSelected = false
var calendar = preload("res://Charachters/Objects/Calender/calendar.tscn").instantiate()
var calendarSelected = false
var tire = preload("res://Charachters/Objects/Tire/tire.tscn").instantiate()
var tireSelected = false
var iron = preload("res://Charachters/Objects/Iron/iron.tscn").instantiate()
var ironSelected = false

func _ready():
	redFrame.texture = redFramePNG
	redFrame.position = Vector2(16, 16)

func _on_sink_button_pressed():
	if sinkSelected:
		refundPoints(1)
		sinkSelected = false
		GameLogic.player1Objects.erase(sink)
		for i in get_node("SinkButton").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 1:
			spendPoints(1)
			sinkSelected = true
			GameLogic.player1Objects.append(sink)
			get_node("SinkButton").add_child(redFrame.duplicate())

func _on_calendar_button_pressed():
	if calendarSelected:
		refundPoints(3)
		calendarSelected = false
		GameLogic.player1Objects.erase(calendar)
		for i in get_node("CalendarButton").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 3:
			spendPoints(3)
			calendarSelected = true
			GameLogic.player1Objects.append(calendar)
			get_node("CalendarButton").add_child(redFrame.duplicate())

func _on_texture_button_pressed():
	if tireSelected:
		refundPoints(3)
		tireSelected = false
		GameLogic.player1Objects.erase(tire)
		for i in get_node("TextureButton").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 3:
			spendPoints(3)
			tireSelected = true
			GameLogic.player1Objects.append(tire)
			get_node("TextureButton").add_child(redFrame.duplicate())
	
func _on_iron_button_pressed():
	if ironSelected:
		refundPoints(2)
		ironSelected = false
		GameLogic.player1Objects.erase(iron)
		for i in get_node("IronButton").get_children():
			i.queue_free()
	else:
		if pointsMax - pointsSpend >= 2:
			spendPoints(2)
			ironSelected = true
			GameLogic.player1Objects.append(iron)
			get_node("IronButton").add_child(redFrame.duplicate())
	
	
func spendPoints(amount) -> void:
	pointsSpend = pointsSpend + amount
	get_node("pointsSpendLabel").text = "Points Spend: " + str(pointsSpend) + "/10"
	get_node("ProgressBar").value = pointsSpend
	
func refundPoints(amount) -> void:
	pointsSpend = pointsSpend - amount
	get_node("pointsSpendLabel").text = "Points Spend: " + str(pointsSpend) + "/10"
	get_node("ProgressBar").value = pointsSpend
	
func _on_start_button_pressed():
	GameLogic.getReady()
	get_tree().change_scene_to_file("res://main.tscn")
