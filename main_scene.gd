class_name Game_Manager extends Node2D
static  var score: int = 0
static var lives: int = 3
static var won: bool = false 
# Awake
func _init() -> void:
	print_debug("Game Started")
	score = 0
	pass

#Start
func _ready() -> void:
	
	pass 

# Update
func _process(_delta: float) -> void:
	var enemies = get_tree().get_nodes_in_group("Enemies").size()
	if enemies <= 0 and won == false:
		won = true
		print("You Won!")
		get_tree().paused = true
	
	pass
#Fixed Update
func _physics_proccess(_delete: float) -> void: 
	pass


#.gd (scripts)
#.tscn (escenas como el uso de la imagen,colisión, nodos)
#.svg (imagen)
