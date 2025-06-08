extends Control


func _on_play_pressed() -> void:
	self.get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_exit_pressed() -> void:
	self.get_tree().quit()
