extends AnimatedSprite2D

var priorityTarget = true
var player
var health = 10
var maxHealth = 100
var cost = 5


func _ready():
	get_node("TextureProgressBar").max_value = maxHealth
	GameLogic.objectDestroyed.connect(effect)
	
	
func effect() -> void:
	print(health)
	print("Trashcan healed")
	heal(5)
	print(health)
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
	get_node("TextureProgressBar").value = health
		
func heal(amount) -> void:
	if (health + amount) > maxHealth:
		health =  maxHealth
	else:
		health = health + amount
	get_node("TextureProgressBar").value = health
