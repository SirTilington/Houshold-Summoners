extends AnimatedSprite2D


var priorityTarget = false
var player
var health = 12
var maxHealth = 12
var target


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	var timer = get_node("Timer")
	timer.wait_time = 4
	timer.start()
	
func effect() -> void:
	if player == 1:
		target = GameLogic.getTargetfromPlayer1()
	if player == 2:
		target = GameLogic.getTargetfromPlayer2()
	target.heal(5)
	
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