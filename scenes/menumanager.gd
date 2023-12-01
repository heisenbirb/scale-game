extends Node2D


func _on_button_button_down():
	self.get_parent().load_next_level()



func _on_button_2_button_down():
	self.get_parent().load_control_menu()


func _on_button_3_button_down():
	get_tree().quit()
