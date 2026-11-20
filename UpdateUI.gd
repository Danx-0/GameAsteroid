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
	ScoreDisplay.text = "Score: "+ str(Game_Manager.score)
	LivesDisplay.text = "Lives: "+ str(Game_Manager.lives)
	if Game_Manager.won == true:
		WonDisplay.visible = true 
	if Game_Manager.lives <= 0:
		GameOverDisplay.visible = true
	pass
