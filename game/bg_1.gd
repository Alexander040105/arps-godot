extends Panel

@onready var continue_label = get_node("/root/Gameplay/bg1/ContinuePrompt")
@onready var bg1 = $bg1

var animation_complete = false

func _ready():
	continue_label.visible = false

func _on_AnimationPlayer_animation_finished(anim_name):
	# When the animation finishes, show the prompt
	if anim_name == "YourAnimationName":  # Replace with the name of your animation
		animation_complete = true
		continue_label.visible = true

func _input(event):
	if animation_complete and event.is_pressed():
		proceed_to_next_action()

func proceed_to_next_action():
	# Logic to proceed when the player presses any button
	animation_complete = false  # Reset for the next time
	continue_label.visible = false  # Hide the label again
	bg1.visible = false
