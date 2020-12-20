extends Control

onready var soundButton = $soundButton
onready var miscButton = $miscButton
onready var exitButton = $exitButton
onready var buttonSound = $AudioStreamPlayer

func _input(event):
	if event.is_action_pressed("pause"):
		#Pause state determines whether or not game is paused.
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		#Makes the main menu buttons visible
		mainMenuVisibleToggle()
		#Hides other menu buttons
		hideOtherMenus()
		visible = new_pause_state
		

func _on_soundButton_pressed():
	soundButton.visible = false
	miscButton.visible = false
	exitButton.visible = false
	buttonSound.play()
	get_node("soundMenu").visible = true

func _on_soundApply_pressed():
	soundButton.visible = true
	miscButton.visible = true
	exitButton.visible = true
	buttonSound.play()
	get_node("soundMenu").visible = false

func _on_miscButton_pressed():
	soundButton.visible = false
	miscButton.visible = false
	exitButton.visible = false
	buttonSound.play()
	get_node("miscMenu").visible = true

func _on_miscApply_pressed():
	mainMenuVisibleToggle()
	buttonSound.play()
	get_node("miscMenu").visible = false

func _on_exitButton_pressed():
	soundButton.visible = false
	miscButton.visible = false
	exitButton.visible = false
	$blankMenu.visible = false
	$pauseText.visible = false
	$areYouSure.visible = true
	buttonSound.play()

func _on_quitConfirm_pressed():
	buttonSound.play()
	get_tree().change_scene("res://Title Screen/TitleScreen.tscn")
	
func _on_quitCancel_pressed():
	soundButton.visible = true
	miscButton.visible = true
	exitButton.visible = true
	$blankMenu.visible = true
	$pauseText.visible = true
	$areYouSure.visible = false
	buttonSound.play()

func mainMenuVisibleToggle():
	soundButton.visible = true
	miscButton.visible = true
	exitButton.visible = true
	

func hideOtherMenus():
	get_node("miscMenu").visible = false
	get_node("soundMenu").visible = false





