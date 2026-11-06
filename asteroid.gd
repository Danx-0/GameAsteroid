class_name NormalAsteroid extends A_Asteroid
enum Size
{
	Big, Medium, Small
}

@export var size : Size = Size.Big
# Called when the node enters the scene tree for the first time.
func _valid_size() -> void:
	var set_scale = 0
	
	if size == Size.Big: set_scale = 1
	elif size == Size.Medium: set_scale =0.5
	else: set_scale = 0.3
	
	for child in get_children():
		(child as Node2D).global_scale *= set_scale
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _physics_process(delta : float) -> void:
	var colliders = get_colliding_bodies()
	for obj in colliders:
			if !(obj is Ship): continue
			(obj as Ship)._take_dmg()
			pass
			
			
func on_dmg_tkn() -> void:
	#GameManager.score += 10 #suma los puntos
	if size == Size.Small:
		queue_free() #destruye el objeto
		return
	
	var newAteroid1 = duplicate() as NormalAsteroid
	var newAteroid2 = duplicate() as NormalAsteroid
	get_parent().add_child(newAteroid1)
	get_parent().add_child(newAteroid2)
	
	# define el tamaño de las copias grande -> mediano, mediano -> pequeño
	var newSize = Size.Medium
	if size == Size.Medium: newSize = Size.Small
	
	newAteroid1.size = newSize
	newAteroid2.size = newSize
	
	# le aplica el cambio de tamaño (escala, colisión, etc)
	newAteroid1._valid_size() 
	newAteroid2._valid_size() 
	
	#var offset = Vector2.RIGHT * 100
	
	newAteroid1.global_position = global_position + Vector2.RIGHT
	newAteroid2.global_position = global_position + Vector2.LEFT
	
	queue_free()
	pass
	
