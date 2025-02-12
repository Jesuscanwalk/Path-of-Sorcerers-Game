extends Control

var start_time := Time.get_ticks_msec()
@onready var time_label: Label = %TimeLabel
@onready var retry_button: Button = %RetryButton
@onready var quit_button: Button = %QuitButton



func open() -> void:
	visible = true
	
	var end_time := Time.get_ticks_msec()
	var total_time_msec := end_time - start_time
	var total_time_s := snappedf(total_time_msec / 1000.0, 0.1)
	time_label.text = "Time: " + str(total_time_s) + "s"


func _on_retry_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit() 
