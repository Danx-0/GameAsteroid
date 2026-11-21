class_name GameManager  extends Node2D

##signal _continuos_actions ###

static var me : Node2D
static var score : int = 0
static var continuos_actions: Signal

func _init() -> void:
	print_debug("Game Started")
	me = self
	score =0
	#continuos_actions = _continuos_actions 
	pass
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _physics_process(_delta: float) -> void:
	continuos_actions.emit()
	
	pass

static func delay_actions(action: Callable, delay:float) -> void:
	await me.get_tree().create_timer(delay).timeout 
	action.call()
	pass
