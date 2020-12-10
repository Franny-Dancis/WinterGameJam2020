extends Control

onready var soundButton = $soundButton
onready var miscButton = $miscButton
onready var exitButton = $exitButton

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
	get_node("soundMenu").visible = true

func _on_soundApply_pressed():
	soundButton.visible = true
	miscButton.visible = true
	exitButton.visible = true
	get_node("soundMenu").visible = false

func _on_miscButton_pressed():
	soundButton.visible = false
	miscButton.visible = false
	exitButton.visible = false
	get_node("miscMenu").visible = true

func _on_miscApply_pressed():
	soundButton.visible = true
	miscButton.visible = true
	exitButton.visible = true
	get_node("miscMenu").visible = false

func _on_exitButton_pressed():
	get_tree().change_scene("res://Title Screen/TitleScreen.tscn")

func mainMenuVisibleToggle():
	soundButton.visible = true
	miscButton.visible = true
	exitButton.visible = true

func hideOtherMenus():
	get_node("miscMenu").visible = false
	get_node("soundMenu").visible = false
