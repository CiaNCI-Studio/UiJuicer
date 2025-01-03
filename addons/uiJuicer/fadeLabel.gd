extends Label
class_name FadeLabel

signal started
signal startedFadeIn
signal startedFadeOut
signal finished
signal finishedFadeIn
signal finishedFadeOut

@export var AutoFadeIn : bool = true
@export var StartVisible : bool = false
@export var FadeInTime : float = 1.0
@export var FadeOutTime : float = 1.0

var fader : Fader

func _ready() -> void:	
	fader = Fader.new()
	fader.AutoFadeIn = AutoFadeIn
	fader.StartVisible = StartVisible
	fader.FadeInTime = FadeInTime
	fader.AutoFadeIn = AutoFadeIn
	fader.FadeOutTime = FadeOutTime
	fader.connect("started", func(): emit_signal("started"))
	fader.connect("startedFadeIn", func(): emit_signal("startedFadeIn"))
	fader.connect("startedFadeOut", func(): emit_signal("startedFadeOut"))
	fader.connect("finished", func(): emit_signal("finished"))
	fader.connect("finishedFadeIn", func(): emit_signal("finishedFadeIn"))
	fader.connect("finishedFadeOut", func(): emit_signal("finishedFadeOut"))
	add_child(fader)

func FadeIn(time : float = FadeInTime):
	fader.FadeIn(time)
	
func FadeOut(time : float = FadeInTime):
	fader.FadeOut(time)
