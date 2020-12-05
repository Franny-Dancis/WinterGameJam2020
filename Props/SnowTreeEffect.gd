extends AnimatedSprite


func _ready():
	connect("animation_finished", self, "_on_animation_finished")

func _on_Hurtbox_area_entered(area):
	frame = 0
	play_random_animation()

func _on_animation_finished():
	stop()

func _on_Stats_no_health():
	queue_free()

func play_random_animation():
	var animations = frames.get_animation_names()
	var animation_id = randi() % animations.size()
	var animation_name = animations[animation_id]
	play(animation_name)
