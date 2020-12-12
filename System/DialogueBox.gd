extends Control

var dialogue = [
	'Hello there, this tutorial is awesome.',
	'If you like what you see, please subscribe.',
	'and if you don\'t, you should do it anyway'
]

var dialogue_index = 0
var finished = false

onready var textLabel = $RichTextLabel
onready var tween = $Tween
onready var nextIndicator = $"next-indicator"

func _ready():
	load_dialogue()
	
func _process(delta):
	nextIndicator.visible = finished
	if Input.is_action_just_pressed("interact"):
		self.visible = true
		load_dialogue()
	
func load_dialogue():
	if dialogue_index < dialogue.size():
		finished = false
		textLabel.bbcode_text = dialogue[dialogue_index]
		textLabel.percent_visible = 0
		tween.interpolate_property(
			textLabel, "percent_visible", 0, 1, 1, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		tween.start()
	else:
		get_tree().paused = false
		queue_free()
	dialogue_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true
