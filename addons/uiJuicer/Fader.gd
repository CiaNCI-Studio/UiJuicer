extends Node
class_name Fader

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
@export var ChangeVisibility : bool = true

@onready var parent : CanvasItem = get_parent() 

func _ready() -> void:	
	if StartVisible:
		parent.modulate.a = 1
		if ChangeVisibility:
			parent.visible = true
	else:
		if ChangeVisibility:
			parent.visible = false
		parent.modulate.a = 0
	if AutoFadeIn:
		FadeIn()

func FadeIn(time : float = FadeInTime):
	emit_signal("started")
	emit_signal("startedFadeIn")
	if ChangeVisibility:
		parent.visible = true
	var tween = create_tween()
	tween.tween_property(parent, "modulate:a", 1, time)
	await tween.finished	
	emit_signal("finished")
	emit_signal("finishedFadeIn")
	
func FadeOut(time : float = FadeOutTime):
	emit_signal("started")
	emit_signal("startedFadeOut")
	var tween = create_tween()
	tween.tween_property(parent, "modulate:a", 0, time)
	await tween.finished
	if ChangeVisibility:
		parent.visible = false
	emit_signal("finished")
	emit_signal("finishedFadeOut")
