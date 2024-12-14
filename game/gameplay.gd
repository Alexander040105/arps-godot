extends Control

@onready var win_texture = $youWon 
@onready var lose_texture = $youLose
@onready var tie_texture = $youTied
@onready var pause_panel = get_node("/root/Gameplay/pausePanel/")
@onready var player_wins_label = $ScoreBoardControl/PlayerScore
@onready var computer_wins_label = $ScoreBoardControl/CompScore

var arps
var player_wins = 0
var computer_wins = 0
var score_to_win = 5			#Change this var for higher difficulty

func _ready():
	arps = Arps.new()
	# Ensure all textures are hidden initially
	if win_texture:
		win_texture.visible = false
	if lose_texture:
		lose_texture.visible = false
	if tie_texture:
		tie_texture.visible = false

func handle_button_pressed(choice):
	var playerChoice = choice
	var computerChoice = arps.getComputerChoice()
	var result = arps.chooseWinner(playerChoice, computerChoice)
	# Record the scores
	if result == "youWin":
		player_wins += 1
	elif result == "youLose":
		computer_wins += 1
	update_win_labels()
	
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true
	# Let the animation play out
	
	# if either one wins, call end screen
	if player_wins == score_to_win:
		result == "youWin"
		displayResult(result)
	elif computer_wins == score_to_win:
		result == "youLose"
		displayResult(result)

func _on_mainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://main-menu.tscn") # Replace with function body.

func _on_playagain_pressed() -> void:
	get_tree().reload_current_scene()
	
func show_comp_animation(player, computer, winner_decision):
	var gameplay_background = get_node("/root/Gameplay/bg1")
	var bato_bato_pick = get_node("/root/Gameplay/initialAni")
	
	if computer == 'r':
		bato_bato_pick.visible = true
		

func displayResult(result: String):
	# Show the appropriate result texture
	match result:
		"youWin":
			win_texture.visible = true
		"youLose":
			lose_texture.visible = true
		"youTied":
			tie_texture.visible = true
	
func update_win_labels():
	player_wins_label.update_score(player_wins)
	computer_wins_label.update_score(computer_wins)

func _on_rock_pressed() -> void:
	handle_button_pressed("r")

func _on_scissors_pressed() -> void:
	handle_button_pressed("s")

func _on_paper_pressed() -> void:
	handle_button_pressed("p")

func _on_water_pressed() -> void:
	handle_button_pressed("w")

func _on_air_pressed() -> void:
	handle_button_pressed("a")

func _on_fire_pressed() -> void:
	handle_button_pressed("f")

func _on_lightning_pressed() -> void:
	handle_button_pressed("i")

func _on_devil_pressed() -> void:
	handle_button_pressed("e")

func _on_dragon_pressed() -> void:
	handle_button_pressed("d")


func _on_pause_button_pressed() -> void:
	pause_panel.set_visible(true)
	
func _on_continue_pressed() -> void:
	pause_panel.set_visible(false)
