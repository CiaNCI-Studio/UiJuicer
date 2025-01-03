extends Button

@export var Orientation : Bouncer.ORIENTATIONS
@export var BounceTime : float = 1.0
@export var BounceAmplitude : float = 10.0

var bouncer : Bouncer

func _ready() -> void:
	bouncer = Bouncer.new()
	bouncer.Orientation = Orientation
	bouncer.BounceAmplitude = BounceAmplitude
	bouncer.BounceTime = BounceTime
	add_child(bouncer)	
	bouncer.Start()
	
