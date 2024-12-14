extends Control

@onready var win_texture = $youWon 
@onready var lose_texture = $youLose
@onready var tie_texture = $youTied
@onready var pause_panel = get_node("/root/Gameplay/pausePanel/")
var arps

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
	print("Player Choice:", playerChoice)
	var computerChoice = arps.getComputerChoice()
	print("Computer Choice:", computerChoice)
	var result = arps.chooseWinner(playerChoice, computerChoice)
	if result == null or result == "":
		print("Error: chooseWinner returned an invalid value.")
	else:
		print("Result:", result)
	
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true
	# Let the animation play out
	
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
