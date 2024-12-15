extends Control

@onready var win_texture = get_node("/root/Gameplay/youWon")
@onready var lose_texture = get_node("/root/Gameplay/youLose")
@onready var tie_texture = get_node("/root/Gameplay/youTied")
@onready var pause_panel = get_node("/root/Gameplay/pausePanel/")
@onready var player_wins_label = $ScoreBoardControl/PlayerScore
@onready var computer_wins_label = $ScoreBoardControl/CompScore
@onready var animationContainer = get_node("/root/Gameplay/bg1/")
@onready var player_choice_indic = get_node("/root/Gameplay/bg1/YOU")
@onready var comp_choice_indic = get_node("/root/Gameplay/bg1/CPU")
@onready var result_indic = get_node("/root/Gameplay/bg1/ResultIndicator")
@onready var continue_prompt = get_node("/root/Gameplay/bg1/ContinuePrompt")
@onready var hbox1 = get_node("/root/Gameplay/HBoxContainer")
@onready var hbox2 = get_node("/root/Gameplay/HBoxContainer2")

#sounds variable
@onready var game_music = get_node("/root/Gameplay/GameMusic/")
@onready var start_sound = get_node("/root/Gameplay/StartSound/")
@onready var button_sound = get_node("/root/Gameplay/ButtonSound/")
@onready var gain_point = get_node("/root/Gameplay/GainPoint/")
@onready var you_won_sound = get_node("/root/Gameplay/YouWonSound/")
@onready var game_over_sound = get_node("/root/Gameplay/GameOverSound/")

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

@onready var hands_names = [Rock_player, Paper_player, Scissor_player, Fire_player, Snake_player, Human_player, Tree_player,
Wolf_player, Sponge_player, Air_player, Water_player, Dragon_player, Devil_player, Lightning_player, Gun_player, Rock_boss, 
Paper_boss, Scissor_boss, Fire_boss, Snake_boss, Human_boss, Tree_boss, Wolf_boss, Sponge_boss, 
Air_boss, Water_boss, Dragon_boss, Devil_boss, Lightning_boss, Gun_boss]

var arps
var score_to_win = 5			#Change this var for higher difficulty
var computerChoice
var playerChoice
var result
var buttons = []

func _ready():
	start_sound.play()
	arps = Arps.new()

	if game_music.is_playing() == false:
		game_music.play()

func handle_button_pressed(choice):
	button_sound.play()
	computerChoice = arps.getComputerChoice()
	playerChoice = choice
	#computer_animation(computerChoice)
	result = arps.chooseWinner(playerChoice, computerChoice)
	# Record the scores
	if result == "youWin":
		Global.player_wins += 1
	elif result == "youLose":
		Global.computer_wins += 1
	
	#show animation
	player_choice_indic.text = "[center]...[/center]"
	comp_choice_indic.text = "[center]...[/center]"
	result_indic.text = "[center] [/center]"
	disable_buttons()
	animationContainer.visible = true
	players_animation(playerChoice, computerChoice)
	$Timer.start(2)
	
func update_indicators(player, computer):
	var playIndic = player
	var compIndic = computer
	match playIndic:
		"r":
			player_choice_indic.text = "[center]YOU: Rock[/center]"
		"p":
			player_choice_indic.text = "[center]YOU: Paper[/center]"
		"s":
			player_choice_indic.text = "[center]YOU: Scissors[/center]"
		"f":
			player_choice_indic.text = "[center]YOU: Fire[/center]"
		"n":
			player_choice_indic.text = "[center]YOU: Snake[/center]"
		"h":
			player_choice_indic.text = "[center]YOU: Human[/center]"
		"t":
			player_choice_indic.text = "[center]YOU: Tree[/center]"
		"l":
			player_choice_indic.text = "[center]YOU: Wolf[/center]"
		"o":
			player_choice_indic.text = "[center]YOU: Sponge[/center]"
		"a":
			player_choice_indic.text = "[center]YOU: Air[/center]"
		"w":
			player_choice_indic.text = "[center]YOU: Water[/center]"
		"d":
			player_choice_indic.text = "[center]YOU: Dragon[/center]"
		"e":
			player_choice_indic.text = "[center]YOU: Devil[/center]"
		"i":
			player_choice_indic.text = "[center]YOU: Lightning[/center]"
		"g":
			player_choice_indic.text = "[center]YOU: Gun[/center]"
	match compIndic:
		"r":
			comp_choice_indic.text = "[center]CPU: Rock[/center]"
		"p":
			comp_choice_indic.text = "[center]CPU: Paper[/center]"
		"s":
			comp_choice_indic.text = "[center]CPU: Scissors[/center]"
		"f":
			comp_choice_indic.text = "[center]CPU: Fire[/center]"
		"n":
			comp_choice_indic.text = "[center]CPU: Snake[/center]"
		"h":
			comp_choice_indic.text = "[center]CPU: Human[/center]"
		"t":
			comp_choice_indic.text = "[center]CPU: Tree[/center]"
		"l":
			comp_choice_indic.text = "[center]CPU: Wolf[/center]"
		"o":
			comp_choice_indic.text = "[center]CPU: Sponge[/center]"
		"a":
			comp_choice_indic.text = "[center]CPU: Air[/center]"
		"w":
			comp_choice_indic.text = "[center]CPU: Water[/center]"
		"d":
			comp_choice_indic.text = "[center]CPU: Dragon[/center]"
		"e":
			comp_choice_indic.text = "[center]CPU: Devil[/center]"
		"i":
			comp_choice_indic.text = "[center]CPU: Lightning[/center]"
		"g":
			comp_choice_indic.text = "[center]CPU: Gun[/center]"

func _input(event):
	if continue_prompt.visible and event.is_pressed():
		if Global.player_wins == score_to_win:
			Global.player_wins = 0
			Global.computer_wins = 0
			displayResult("youWin")
		elif Global.computer_wins == score_to_win:
			Global.player_wins = 0
			Global.computer_wins = 0
			displayResult("youLose")
		
		accept_event()
		button_sound.play()
		continue_prompt.visible = false  
		animationContainer.visible = false 
		set_process_input(false)
		
		for players_hand_names in hands_names:
			players_hand_names.set_visible(false)
		
		enable_buttons()

func _on_mainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://main-menu.tscn") 

func _on_playagain_pressed() -> void:
	get_tree().reload_current_scene()
	
func displayResult(result: String):
	# Show the appropriate result texture
	match result:
		"youWin":
			game_music.stop()
			you_won_sound.play()
			win_texture.visible = true
		"youLose":
			game_music.stop()
			game_over_sound.play()
			lose_texture.visible = true
		"youTied":
			tie_texture.visible = true
	
func update_win_labels():
	player_wins_label.update_score(Global.player_wins)
	computer_wins_label.update_score(Global.computer_wins)
	
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

func _on_human_pressed() -> void:
	handle_button_pressed("h")

func _on_gun_pressed() -> void:
	handle_button_pressed("g")
	
func _on_sponge_pressed() -> void:
	handle_button_pressed("o") 
	
func _on_wolf_pressed() -> void:
	handle_button_pressed("l")

func _on_pause_button_pressed() -> void:
	button_sound.play()
	pause_panel.set_visible(true)
	
func _on_continue_pressed() -> void:
	button_sound.play()
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

func _on_Timer_timeout() -> void:
	gain_point.play()
	# Prompt: Press any button to continue
	continue_prompt.visible = true
	set_process_input(true)
	
	# Update the result indicator
	match result:
		"youWin":
			result_indic.text = "[center]You won![/center]"
		"youLose":
			result_indic.text = "[center]You lost![/center]"
		"youTied":
			result_indic.text = "[center]You tied![/center]"
	
	# Update the choice indicators
	update_indicators(playerChoice, computerChoice)
	update_win_labels()

func disable_buttons():
	for button in hbox1.get_children():
		if button is Button:
			button.disabled = true
	
	for button in hbox2.get_children():
		if button is Button:
			button.disabled = true

func enable_buttons():
	for button in hbox1.get_children():
		if button is Button:
			button.disabled = false
			
	for button in hbox1.get_children():
		if button is Button:
			button.disabled = false
