extends Node
@export var ScoreDisplay : TextEdit
@export var LivesDisplay : TextEdit
@export var GameOverDisplay : TextEdit
@export var WonDisplay : TextEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	ScoreDisplay.text = "Score: "+ str(GameManager.score)
	LivesDisplay.text = "Lives: "+ str(GameManager.lives)
	if GameManager.won == true:
		WonDisplay.visible = true 
	if GameManager.lives <= 0:
		GameOverDisplay.visible = true
	pass
