extends Control

@onready var win_texture = $youWon 
@onready var lose_texture = $youLose
@onready var tie_texture = $youTied
@onready var pause_panel = get_node("/root/Gameplay/pausePanel/")
@onready var player_wins_label = $ScoreBoardControl/PlayerScore
@onready var computer_wins_label = $ScoreBoardControl/CompScore
@onready var animationContainer = get_node("/root/Gameplay/bg1/")

#Player animations
@onready var Rock_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Rock-player/")
@onready var Paper_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Paper-player/")
@onready var Scissor_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Scissor-player/")
@onready var Fire_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Fire-player/")
@onready var Snake_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Snake-player/")
@onready var Human_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Human-player/")
@onready var Tree_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Tree-player/")
@onready var Wolf_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Wolf-player/")
@onready var Sponge_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Sponge-player/")
@onready var Air_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Air-player/")
@onready var Water_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Water-player/")
@onready var Dragon_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Dragon-player/")
@onready var Devil_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Devil-player/")
@onready var Lightning_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Lightning-player/")
@onready var Gun_player = get_node("/root/Gameplay/bg1/aniContainer/playerHands/Gun-player/")

#Player animations
@onready var Rock_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Rock-boss/")
@onready var Paper_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Paper-boss/")
@onready var Scissor_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Scissors-boss/")
@onready var Fire_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Fire-boss/")
@onready var Snake_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Snake-boss/")
@onready var Human_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Human-boss/")
@onready var Tree_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Tree-boss/")
@onready var Wolf_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Wolf-boss/")
@onready var Sponge_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Sponge-boss/")
@onready var Air_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Air-boss/")
@onready var Water_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Water-boss/")
@onready var Dragon_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Dragon-boss/")
@onready var Devil_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Devil-boss/")
@onready var Lightning_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Lightning-boss/")
@onready var Gun_boss = get_node("/root/Gameplay/bg1/aniContainer/bossHands/Gun-boss/")

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
	var computerChoice = arps.getComputerChoice()
	var playerChoice = choice
	#computer_animation(computerChoice)
	var result = arps.chooseWinner(playerChoice, computerChoice)
	# Record the scores
	if result == "youWin":
		player_wins += 1
	elif result == "youLose":
		computer_wins += 1
	
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true
	players_animation(playerChoice, computerChoice)
	update_win_labels()
	
	# Let the animation play out
	# Press any button to continue
	
	
	# if either one wins, call end screen
	if player_wins == score_to_win:
		result == "youWin"
		displayResult(result)
	elif computer_wins == score_to_win:
		result == "youLose"
		displayResult(result)

func _on_mainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://main-menu.tscn") 

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
	
	
#animations
func players_animation(player_choice, computer_choice):
	animationContainer.set_visible(true)
	if player_choice == "r":
		Rock_player.set_visible(true)
		Rock_player.play()
	elif player_choice == "p":
		Paper_player.set_visible(true)
		Paper_player.play()
	elif player_choice == "s":
		Scissor_player.set_visible(true)
		Scissor_player.play()
	elif player_choice == "f":
		Fire_player.set_visible(true)
		Fire_player.play()
	elif player_choice == "n":
		Snake_player.set_visible(true)
		Snake_player.play()
	elif player_choice == "h":
		Human_player.set_visible(true)
		Human_player.play()
	elif player_choice == "t":
		Tree_player.set_visible(true)
		Tree_player.play()
	elif player_choice == "l":
		Wolf_player.set_visible(true)
		Wolf_player.play()
	elif player_choice == "o":
		Sponge_player.set_visible(true)
		Sponge_player.play()
	elif player_choice == "a":
		Air_player.set_visible(true)
		Air_player.play()
	elif player_choice == "w":
		Water_player.set_visible(true)
		Water_player.play()
	elif player_choice == "d":
		Dragon_player.set_visible(true)
		Dragon_player.play()
	elif player_choice == "e":
		Devil_player.set_visible(true)
		Devil_player.play()
	elif player_choice == "i":
		Lightning_player.set_visible(true)
		Lightning_player.play()
	elif player_choice == "g":
		Gun_player.set_visible(true)
		Gun_player.play()
		

	if computer_choice == "r":
			Rock_boss.set_visible(true)
			Rock_boss.play()
	elif computer_choice == "p":
		Paper_boss.set_visible(true)
		Paper_boss.play()
	elif computer_choice == "s":
		Scissor_boss.set_visible(true)
		Scissor_boss.play()
	elif computer_choice == "f":
		Fire_boss.set_visible(true)
		Fire_boss.play()
	elif computer_choice == "n":
		Snake_boss.set_visible(true)
		Snake_boss.play()
	elif computer_choice == "h":
		Human_boss.set_visible(true)
		Human_boss.play()
	elif computer_choice == "t":
		Tree_boss.set_visible(true)
		Tree_boss.play()
	elif computer_choice == "l":
		Wolf_boss.set_visible(true)
		Wolf_boss.play()
	elif computer_choice == "o":
		Sponge_boss.set_visible(true)
		Sponge_boss.play()
	elif computer_choice == "a":
		Air_boss.set_visible(true)
		Air_boss.play()
	elif computer_choice == "w":
		Water_boss.set_visible(true)
		Water_boss.play()
	elif computer_choice == "d":
		Dragon_boss.set_visible(true)
		Dragon_boss.play()
	elif computer_choice == "e":
		Devil_boss.set_visible(true)
		Devil_boss.play()
	elif computer_choice == "i":
		Lightning_boss.set_visible(true)
		Lightning_boss.play()
	elif computer_choice == "g":
		Gun_boss.set_visible(true)
		Gun_boss.play()

#func computer_animation(computer_choice):
	
		

		

	
