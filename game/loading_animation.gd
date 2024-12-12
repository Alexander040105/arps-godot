extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_loading_ready():
	play("default")  # Play the "idle" animation
	# Connect the 'animation_finished' signal to the function
	var is_idle = "idle"
	_on_loading_animation_changed(is_idle)


func _on_loading_animation_changed(anim_name: String):
	if anim_name == "idle":
		get_tree().change_scene_to_file("res://main-menu.tscn")
