#extends CharacterBody2D

# Velocidad del personaje
#@export var velocidad = 300.0

#func _physics_process(_delta):
	# Obtenemos la dirección basada en las teclas configuradas
	#var direccion = Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	
	# Si hay movimiento, aplicamos la velocidad
	#if direccion:
		#velocity = direccion * velocidad
	#else:
		# Si no pulsamos nada, se detiene suavemente
		#velocity = velocity.move_toward(Vector2.ZERO, velocidad)

	# move_and_slide maneja las colisiones automáticamente
	#move_and_slide()


extends CharacterBody2D

@export var velocidad = 300.0
@onready var animacion = $AnimatedSprite2D

func _physics_process(_delta):
	# 1. Obtener la dirección
	var direccion = Input.get_vector("izquierda", "derecha", "arriba", "abajo")
	
	if direccion != Vector2.ZERO:
		# --- ESTO PASA CUANDO TE MUEVES ---
		velocity = direccion * velocidad
		animacion.play("caminar")
		
		# Actualizamos la rotación basándonos en el movimiento
		# direccion.angle() calcula el ángulo exacto (en radianes)
		animacion.rotation = direccion.angle()
		
	else:
		# --- ESTO PASA CUANDO ESTÁS QUIETO ---
		velocity = velocity.move_toward(Vector2.ZERO, velocidad)
		animacion.play("quieto")
		
		# ¡IMPORTANTE!: Aquí NO tocamos la rotación.
		# Al no escribir nada sobre 'animacion.rotation', el nodo conserva
		# el último ángulo que se le asignó cuando te estabas moviendo.

	move_and_slide()
