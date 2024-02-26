extends Sprite2D


var bloodTexture = preload("res://Charachters/Objects/Tire/sprite_1.png")

var priorityTarget = false
var player
var health = 8
var maxHealth = 8
var target


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	var timer = get_node("Timer")
	timer.wait_time = 11
	timer.start()
	
	
func effect() -> void:
	if player == 1:
		target = GameLogic.getTargetfromPlayer2()
	if player == 2:
		target = GameLogic.getTargetfromPlayer1()
	target.takeDamage(1000)
	
func _on_timer_timeout():
	effect()
	get_node("AudioStreamPlayer2D").play()
	texture = bloodTexture
	
func takeDamage(amount) -> void:
	health = health - amount
	if health <= 0:
		if player == 1:
			GameLogic.player1Objects.erase(self)
		if player == 2:
			GameLogic.player2Objects.erase(self)
		GameLogic.checkWinner()
		queue_free()
	
func heal(amount) -> void:
	if (health + amount) > maxHealth:
		health =  maxHealth
	else:
		health = health + amount
