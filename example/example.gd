extends Control

@onready var timed_label: TimedLabel = $TextArea/TimedLabel
@onready var delayed: FadeLabel = $Delayed

func _on_timed_label_start() -> void:
	print_debug("Start text")
@onready var button_skip_fader: Fader = $TextArea/BounceButton/ButtonSkipFader


func _on_timed_label_key_stroke(key: String) -> void:
	print_debug("Keystroke: " + key)


func _on_timed_label_end() -> void:
	print_debug("Text Finished")


func _on_bounce_button_pressed() -> void:
	timed_label.end()
	button_skip_fader.FadeOut()


func _on_title_finished() -> void:
	delayed.FadeIn()
