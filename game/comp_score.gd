extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func update_score(score: int):
	# Updates the label with the given score
	text = "Computer\n" + str(score) + " / 5"
