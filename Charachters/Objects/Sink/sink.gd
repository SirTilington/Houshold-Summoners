extends AnimatedSprite2D

var priorityTarget = false
var player
var health = 10
var maxHealth = 10
var target


func _ready():
	var timer = get_node("Timer")
	timer.wait_time = 1
	timer.start()
	
	
func effect() -> void:
	if player == 1:
		target = GameLogic.getTargetfromPlayer2()
	if player == 2:
		target = GameLogic.getTargetfromPlayer1()
	if target != null:
		target.takeDamage(1)
	
func _on_timer_timeout():
	effect()
	get_node("AudioStreamPlayer2D").play()
	play("default")	
	
func takeDamage(amount) -> void:
	health = health - amount
	print(health)
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
	

