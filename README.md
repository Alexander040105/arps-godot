<img src="./game/buttons/(No BG) Logo.png">

So far what I've discovered with the use of the official Godot tutorial:

1. CPP is used to make the functions that will be called by the GDextension
2. I've configured everything na so just clone this repository and see if you can run it
4. If not, kindly check the video for reference on how to configure it on your device, pero so far I think the only problem will be what c++ compiler you are going to use
5. You guys should have a Godot 3.4 in your devices
6. Import the project folder that is named "game" on this repository to the Godot 3.4
7. From there, you wiill see the main.gd file wherein cinacall nya yung function ng cpp file na nasa src folder ng repository na ito
8. If you would like to study the structure of the cpp files and header files, look at the src folder especially the summator.cpp and summator.h which is tackled dun sa YT video 

The link for the yt tutorial:
<a href="https://www.youtube.com/watch?v=4R0uoBJ5XSk">YT Tutorial</a>
<a href="https://docs.google.com/presentation/d/1bkAcMLfBbDl3Nq7iMIEwmxs7qZebyoSxc7gIIO3QEWg/edit#slide=id.g2f98118b4ff_0_8">Powerpoint Presentation from the YT Tutorial</a>

Our to-do list for this is:

1. Make the scenes
2. Do the animation
3. Learn the functions that we will use for each of the scenes especially functions for the main gameplay and the animation
4. Connect the scenes with each other

Breakdown of the the functions(just add more if may need pa tayong functions):

The main ones:
1. getUserChoice()
2. getComputerChoice()
3. showChoice()
4. chooseWinner()

Take note: this can be slightly different since we're going to script the buttons and we're not going to use text input and also we'll program it to trigger the animation for showing the hands and the winner for each action.

So expect that these 4 functions will be branched out

Other functions that I could think of for our game:

Functions that will connect everything scene by scene:
gameLoads()
startGame()
exitGame()
pauseGame()
muteMusic()

bale yung logic is:

var function = Function.new()
var comp_choice = function.Computer_choice()
var choose_winner = function.Choose_winner(player, comp_choice)