extends Area2D

func _on_present_body_entered(body):
	queue_free()
