extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var arps = $Arps
@onready var youWon = get_node("/root/Gameplay/youWon")
@onready var youLose = get_node("/root/Gameplay/youLose")
@onready var youTied = get_node("/root/Gameplay/youTied")
@onready var gameplay_background = get_node("/root/Gameplay/bg1")
@onready var pausePanel = get_node("/root/Gameplay/pausePanel")

func _on_rock_pressed(choice: String = "r") -> void:
	arps.playerChoice = choice
	var computer = arps.get_computer_choice()
	var decision = arps.choose_winner()
	gameplay_background.visible = true
	# Let the animation play out
	show_comp_animation(choice, computer, decision)
	


func _on_scissors_pressed() -> void:
	print('s') 
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true
	# Let the animation play out
	


func _on_paper_pressed() -> void:
	print('p') # Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true
	# Let the animation play out


func _on_water_pressed() -> void:
	print('w')# Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true
	# Let the animation play out


func _on_wind_pressed() -> void:
	print('a') # Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true
	# Let the animation play out


func _on_fire_pressed() -> void:
	print('f') # Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true
	# Let the animation play out



func _on_electric_pressed() -> void:
	print('i') # Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true
	# Let the animation play out


func _on_devil_pressed() -> void:
	print('e') # Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true
	# Let the animation play out


func _on_dragon_pressed() -> void:
	print('d') # Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true
	# Let the animation play out


func _on_mainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://main-menu.tscn") # Replace with function body.


func _on_playagain_pressed() -> void:
	get_tree().change_scene_to_file("res://gameplay-animation.tscn")
	
func show_comp_animation(player, computer, winner_decision):
	var gameplay_background = get_node("/root/Gameplay/bg1")
	var bato_bato_pick = get_node("/root/Gameplay/initialAni")
	
	if computer == 'r':
		bato_bato_pick.visible = true
		arps.showResult()
		
		

	#var arps_func = Arps.new()
	#var choose_winner = Arps.chooseWinner(player: String, computer: String)
	#if choose_winner == 'w':
	#	you win screen

func _on_play_again_pressed() -> void:
	youWon.set_visible(false) 
	youLose.set_visible(false)
	youTied.set_visible(false)


func _on_leave_pressed() -> void:
	get_tree().change_scene_to_file("res://main-menu.tscn")


func _on_pause_button_pressed() -> void:
	pausePanel.set_visible(true)


func _on_continue_pressed() -> void:
	pausePanel.set_visible(false)
