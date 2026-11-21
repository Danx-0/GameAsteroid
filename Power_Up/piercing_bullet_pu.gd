class_name PiercingBulletPU extends APowerUp
@export var p_bullet_scene : PackedScene
var stopped : bool = false 
func init() -> void:
	pass

func activate() -> void:
	print("hola")
	var result = GameManager.continuos_actions.connect(replace_bullet_for_piercing)
	print (result)
	GameManager.delay_actions(stop,5)
	pass

func replace_bullet_for_piercing() ->void:
	for child in GameManager.me.get_children():
		print(child)
		if !(child is ABullet) || child is PiercingBullet: continue
		var other =child as ABullet
		var newPBullet = p_bullet_scene.instantiate() as PiercingBullet
		GameManager.me.add_child(newPBullet)
		newPBullet.shoot(other.linear_velocity)
		other.queue_free()
	pass
	
func stop() -> void:
	
	if stopped : return 
	stopped = true
	GameManager.continuos_actions.disconnect(replace_bullet_for_piercing)
	queue_free()
	pass
