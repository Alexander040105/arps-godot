extends Control

@onready var lobby_music = get_node("/root/Control/LobbyMusic/")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if lobby_music.is_playing() == false:
		lobby_music.play()
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
