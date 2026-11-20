class_name Bullet extends ABullet

func on_physics_process(_delta:float) -> void:
	
	pass
	
func on_asteroid_collision(_asteroid : A_Asteroid):
	queue_free()
	pass
