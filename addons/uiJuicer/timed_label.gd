extends Label
class_name  TimedLabel

signal Start
signal KeyStroke(key: String)
signal End

@export var Auto_Start : bool = false
@export var Delay_Start : float = 0
@export var Interval : float = 0.2
@export var Interval_Variation : float = 0.1
@export var Audio : AudioStream
@export var Pitch : float = 1
@export var Pitch_Variation : float = 0.2
@export var Volume_Db : float = 0
@export var Ignore_Blank_Spaces : bool = true

var audio_player : AudioStreamPlayer
var text_sequence : String = ''
var index : int = 0
var timer : float = 0
var active : bool = false

func _ready() -> void:
	if Audio:
		audio_player = AudioStreamPlayer.new()
		add_child(audio_player)	
		audio_player.pitch_scale = Pitch
		audio_player.volume_db = Volume_Db
		audio_player.stop()		
		audio_player.stream = Audio
	text_sequence = text
	text = ''
	active = Auto_Start
	timer = Delay_Start

func _process(delta: float) -> void:
	if not active:
		return		
	if index == 1:
		emit_signal("Start")
	timer = timer - delta
	if timer <= 0:
		if text_sequence[index] == ' ' and Ignore_Blank_Spaces:
			text = text + text_sequence[index]
			index = index + 1
			if index >= text_sequence.length():
				end()
				return
			
		if Interval_Variation != 0:
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			timer = Interval + (rng.randf_range((-1*Interval_Variation), Interval_Variation))
		else:
			timer = Interval
		text = text + text_sequence[index]
		emit_signal("KeyStroke", text_sequence[index])
		index = index + 1
		if audio_player:
			if Pitch_Variation != 0:				
				var rng = RandomNumberGenerator.new()
				rng.randomize()
				audio_player.pitch_scale = Pitch + (rng.randf_range((-1*Pitch_Variation), Pitch_Variation))
			audio_player.play()
		if index >= text_sequence.length():
			end();

func define_text(text : String):
	text_sequence = text
	text = ''
						
func start():
	text = ''
	index = 0
	timer = Delay_Start
	active = true

func end():
	text = text_sequence	
	timer = 0
	active = false
	if audio_player:
		audio_player.stream_paused = true
		audio_player.stop()
	emit_signal("End")
