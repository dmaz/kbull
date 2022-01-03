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
	firstTime = OS.get_system_time_msecs()
	time = OS.get_system_time_msecs()

func add(label,value):
	lines.append([label, value])

func _physics_process(_delta):
	var text:String

	text = "FPS: %s\n" % [Engine.get_frames_per_second()]
	text += "MEM: %s\n" % [OS.get_static_memory_usage()]
	text += "FRAME: %s\n" % [frameTime]

	for line in lines:
		text += "%s: %s\n" % [line[0],line[1]]

	$Label.text = text
	lines = []


#func _process(delta: float) -> void:
	frameTime = OS.get_system_time_msecs() - time
	if tick > 500 and frameTime > logTime:
		firstTime = OS.get_system_time_msecs() - firstTime
		print('%s'%tick)
		if quit:
			get_tree().quit()

	time = OS.get_system_time_msecs()
