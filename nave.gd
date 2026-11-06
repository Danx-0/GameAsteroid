class_name Ship extends RigidBody2D

@export_range(1, 5) var hitPoints = 3
#Capas de colisión: 1 =nave, 2 =bala, 3 =asteroide
#Máscaras: con q capas choca cada objeto (nave -> 3, asteroide -> 1 y 2)
@export_range(200,800, 5) var speed : float = 600 # Velocidad de movimiento de la nave

@export_category("Shooting")#Escena de la bala que se va a crear al disparar 

@export var bullet: PackedScene #@export es como el serializefield de unity
@export var pivot: Node2D

var initPos = Vector2.ZERO
var iFrames = 0
# start
func _ready() -> void:
	initPos = global_position
	pass 

#Update
func _process(delta: float) -> void:
	pass
	#fixed update
func _physics_process(delta: float) -> void:
	
	if iFrames > 0:
		contact_monitor = false
		iFrames -= 1
		pass
	
	if Input.is_action_just_pressed("Shoot"):
		_shoot()
	var direction: Vector2 = Input.get_vector("Left","Right","Up","Down").normalized() #var le da direccion para darle una direccion
	linear_velocity = direction * speed
	pass
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var screen_size := get_viewport_rect().size
	#Posición actual de la nave según la física
	var t := state.transform
	t.origin.x = wrapf(t.origin.x, 0, screen_size.x)	# wrapf=si se sale por un lado, aparece por el contrario
	t.origin.y = wrapf(t.origin.y, 0, screen_size.y)
	#Le regresa la nueva posición a la física
	state.transform = t


func _take_dmg() -> void:
	hitPoints-=1
	teleport(initPos)
	linear_velocity = Vector2.ZERO
	iFrames = 10
	

	#si ya no hay vidas, se destruye la nave
	if hitPoints == 0:
		queue_free()
		print_debug("Ship Destroyed")

	pass
	
func _shoot() -> void:
	var bulletobjt = (bullet.instantiate()) 
	get_parent().add_child(bulletobjt)
	bulletobjt.global_position = pivot.global_position
	bulletobjt.linear_velocity = Vector2.UP * 1000
	pass
	
func teleport(pos : Vector2) -> void:
	PhysicsServer2D.body_set_state(
		get_rid(),
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(pos)
	)
	pass
