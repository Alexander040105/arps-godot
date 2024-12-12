extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_rock_pressed() -> void:
	print('r') # Replace with function body.


func _on_scissors_pressed() -> void:
	print('s') 
	var gameplay_background = get_node("/root/Gameplay/bg1")
	var comp_choice = 'r'
	gameplay_background.visible = true
	#bato_bato_pick.visible = true
	show_comp_animation(comp_choice)
	


func _on_paper_pressed() -> void:
	print('p') # Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true


func _on_water_pressed() -> void:
	print('w')# Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true


func _on_wind_pressed() -> void:
	print('a') # Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true


func _on_fire_pressed() -> void:
	print('f') # Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true



func _on_electric_pressed() -> void:
	print('i') # Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true


func _on_devil_pressed() -> void:
	print('e') # Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true


func _on_dragon_pressed() -> void:
	print('d') # Replace with function body.
	var gameplay_background = get_node("/root/Gameplay/bg1")
	gameplay_background.visible = true


func _on_mainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://main-menu.tscn") # Replace with function body.


func _on_playagain_pressed() -> void:
	get_tree().change_scene_to_file("res://gameplay-animation.tscn")
	
func show_comp_animation(computer):
	var gameplay_background = get_node("/root/Gameplay/bg1")
	var bato_bato_pick = get_node("/root/Gameplay/initialAni")
	
	if computer == 'r':
		bato_bato_pick.visible = true
		

	#var arps_func = Arps.new()
	#var choose_winner = Arps.chooseWinner(player: String, computer: String)
	#if choose_winner == 'w':
	#	you win screen
