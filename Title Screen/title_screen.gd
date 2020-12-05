extends Control


var scene_path_to_load

# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu/CenterRow/Buttons/NewGameButton.grab_focus()
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_Pressed", [button.sceneToLoad])

func _on_Button_Pressed(sceneToLoad):
	scene_path_to_load = sceneToLoad
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
