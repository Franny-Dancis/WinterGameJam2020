extends Control

var dialogue = [
	'Hello there, this tutorial is awesome.',
	'If you like what you see, please subscribe.',
	'and if you don\'t, you should do it anyway'
]

var dialogue_index = 0
var finished = false

func _ready():
	load_dialogue()
	
func _process(delta):
	$"next-indicator".visible = finished
	if Input.is_action_just_pressed("interact"):
		load_dialogue()
	
func load_dialogue():
	if dialogue_index < dialogue.size():
		finished = false
		$RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		get_tree().paused = false
		queue_free()
	dialogue_index += 1

func _on_Tween_tween_completed(object, key):
	finished = true
