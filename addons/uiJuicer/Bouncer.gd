extends Node
class_name Bouncer

enum ORIENTATIONS {
	VERTICAL,
	HORIZONTAL
}

@export var Orientation : ORIENTATIONS = ORIENTATIONS.VERTICAL
@export var BounceTime : float = 1.0
@export var BounceAmplitude : float = 10.0
@export var AutoStart : bool = true

var animationPlayer : AnimationPlayer

func _ready() -> void:
	if AutoStart:
		Start()

func Start():
	animationPlayer = AnimationPlayer.new()
	add_child(animationPlayer)
	var animation = Animation.new()
	animation.add_track(Animation.TYPE_BEZIER, 0)
	var zeroDisplacement = 0
	if Orientation == ORIENTATIONS.VERTICAL:
		animation.track_set_path(0, "..:position:y")
		zeroDisplacement = get_parent().position.y
	else:		
		animation.track_set_path(0, "..:position:x")
		zeroDisplacement = get_parent().position.x	
	animation.bezier_track_insert_key(0, 0, zeroDisplacement, Vector2.ZERO, Vector2(BounceTime/2, BounceAmplitude))
	animation.bezier_track_insert_key(0, BounceTime, zeroDisplacement , Vector2((BounceTime/2) * -1, BounceAmplitude * -1), Vector2.ZERO)			
	animation.loop_mode = Animation.LOOP_LINEAR
	var lib = AnimationLibrary.new()
	lib.add_animation("bounce", animation)
	animationPlayer.add_animation_library("bouncelib", lib)
	animationPlayer.play("bouncelib/bounce")
