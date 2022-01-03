extends Node2D

var bullet = preload('Bullet.tscn')
var tick:int = 0
var count:int = 0

func _physics_process(delta: float) -> void:
	tick += 1
	if !Input.is_action_pressed('mouseButton0'):
		for i in 30:
			var b = bullet.instance()
			var pos = Vector2(512,300)
			var dir = Vector2.RIGHT.rotated(randf()*2.0*PI)
#			var dir = Vector2().from_angle(randf()*2.0*PI)
			b.rotation = dir.angle()
			b.init(pos,dir)
			b.connect('expired',self,'onExpired')
			add_child(b)
			count += 1

	DLog.add('tick',tick)
	DLog.add('count',count)

func onExpired() -> void:
	count -= 1

