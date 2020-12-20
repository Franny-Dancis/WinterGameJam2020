extends Control


func _on_sfxBox_toggled(button_pressed):
	#Turn off sound
	AudioServer.set_bus_mute(1, not AudioServer.is_bus_mute(1))  

func _on_musicBox_toggled(button_pressed):
	#Turn off music
	AudioServer.set_bus_mute(2, not AudioServer.is_bus_mute(2))
