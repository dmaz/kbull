extends KinematicBody2D

var maxLife:int = 24
var life:int = 0
var speed:float = 1930
var velocity:Vector2

signal expired

func init(pos, dir):
	position = pos
	rotation = dir.angle()
	velocity = dir * speed

func _physics_process(delta: float) -> void:
	life += 1
	if life > maxLife:
		emit_signal('expired')
		queue_free()

	move_and_slide(velocity*delta*60)
