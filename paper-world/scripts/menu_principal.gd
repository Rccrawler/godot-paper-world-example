extends Control

func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://escenas/mundo.tscn")


func _on_salir_pressed():
	get_tree().quit()# Replace with function body.
