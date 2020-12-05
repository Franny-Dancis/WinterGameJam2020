extends AnimatedSprite

onready var collisionShape = $StaticBody2D/CollisionShape2D

var dead = false

func _ready():
	connect("animation_finished", self, "_on_animation_finished")

func _on_Hurtbox_area_entered(area):
	if dead == false:
		play("Animate")

func _on_animation_finished():
	stop()
	frame = 4
	dead = true
	collisionShape.set_disabled(true)
