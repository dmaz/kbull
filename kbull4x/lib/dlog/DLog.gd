extends CanvasLayer

var lines = []

var tick:int = 0
var time:int
var firstTime:int
var frameTime:int
var startup:int = 250
var logTime:int = 2
var quit:bool = true

func _ready() -> void:
	firstTime = Time.get_ticks_msec()
	time = Time.get_ticks_msec()

func add(label,value):
	lines.append([label, value])

func _physics_process(_delta):
	var text:String

	text = "FPS: %s\n" % [Engine.get_frames_per_second()]
	text += "MEM: %s\n" % [OS.get_static_memory_usage()]
	text += "FRAME: %s\n" % [frameTime]
#	text += "WAITERS: %s\n" % [Waiter.waiters.size()]

	for line in lines:
		text += "%s: %s\n" % [line[0],line[1]]

	$Label.text = text
	lines = []


#func _process(delta: float) -> void:
	frameTime = Time.get_ticks_msec() - time
	if tick > 500 and frameTime > logTime:
		firstTime = Time.get_ticks_msec() - firstTime
		print('%s'%tick)
		if quit:
			get_tree().quit()

	time = Time.get_ticks_msec()
