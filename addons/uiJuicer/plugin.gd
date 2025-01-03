@tool
extends EditorPlugin

func _enter_tree() -> void:
	add_custom_type("TimedLabel", "Label", preload("res://addons/uiJuicer/timed_label.gd"), preload("res://addons/uiJuicer/TimedLabel.svg"))
	add_custom_type("Bouncer", "Node", preload("res://addons/uiJuicer/Bouncer.gd"), preload("res://addons/uiJuicer/Bouncer.svg"))
	add_custom_type("BounceButton", "Button", preload("res://addons/uiJuicer/bounce_button.gd"), preload("res://addons/uiJuicer/BounceButton.svg"))
	add_custom_type("Fader", "Node", preload("res://addons/uiJuicer/Fader.gd"), preload("res://addons/uiJuicer/Fader.svg"))
	add_custom_type("FadeLabel", "Label", preload("res://addons/uiJuicer/fadeLabel.gd"), preload("res://addons/uiJuicer/FadeLabel.svg"))
	add_custom_type("FadeButton", "Button", preload("res://addons/uiJuicer/fadeButton.gd"), preload("res://addons/uiJuicer/FadeButton.svg"))

func _exit_tree() -> void:
	remove_custom_type("TimedLabel")
	remove_custom_type("Bouncer")
	remove_custom_type("BounceButton")
	remove_custom_type("Fader")
	remove_custom_type("FadeLabel")
	remove_custom_type("FadeButton")
