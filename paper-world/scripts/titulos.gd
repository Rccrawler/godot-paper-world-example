extends Control

func _on_timer_timeout():
	# Cambia a la escena del menú (la crearemos ahora)
	get_tree().change_scene_to_file("res://escenas/MenuPrincipal.tscn")
