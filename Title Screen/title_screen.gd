extends Control


onready var fallingElf = $fallingElf
onready var animationPlayer = $fallingElf/AnimationPlayer
onready var sleepingAnimation = $sleepingAnimation
onready var wakeUpAnimation = $wakeUp

var scene_path_to_load

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	$Menu/CenterRow/Buttons/NewGameButton.grab_focus()
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_Pressed", [button.sceneToLoad])

func _on_Button_Pressed(sceneToLoad):
	if (sceneToLoad == "res://World.tscn"):
		sleepingAnimation.visible = false
		wakeUpAnimation.visible = true
		yield(get_tree().create_timer(1), "timeout")
		fallingElf.visible = true
		animationPlayer.play("falling")
		yield(get_tree().create_timer(1.2), "timeout")
	scene_path_to_load = sceneToLoad
	$FadeIn.show()
	$FadeIn.fade_in()


func _on_FadeIn_fade_finished():
	get_tree().change_scene(scene_path_to_load)
