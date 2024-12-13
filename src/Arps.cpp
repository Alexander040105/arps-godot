#include "Arps.h"
#include <godot_cpp/core/class_db.hpp>
#include <godot_cpp/classes/node.hpp>
#include <godot_cpp/classes/texture_rect.hpp>
#include <godot_cpp/variant/utility_functions.hpp>
#include <cstdlib>
#include <ctime>

void Arps::_bind_methods() {
    ClassDB::bind_method(D_METHOD("getComputerChoice"), &Arps::getComputerChoice);
    ClassDB::bind_method(D_METHOD("chooseWinner", "playerChoice", "computerChoice"), &Arps::chooseWinner);
    ClassDB::bind_method(D_METHOD("get_playerChoice"), &Arps::get_playerChoice);
    ClassDB::bind_method(D_METHOD("set_playerChoice"), &Arps::set_playerChoice);
}

Arps::Arps() {
    std::srand(std::time(nullptr)); // Initialize random seed
}

Arps::~Arps() {}

String Arps::getComputerChoice(){
    int num = std::rand() % 15; // Generate a number between 0 and 14

	switch(num){                      
		case 0: return String::chr('r');
		case 1: return String::chr('p');
		case 2: return String::chr('s');

        case 3: return String::chr('f');
		case 4: return String::chr('n');
		case 5: return String::chr('h');

        case 6: return String::chr('t');
		case 7: return String::chr('l');
		case 8: return String::chr('o');

        case 9: return String::chr('a');
		case 10: return String::chr('w');
		case 11: return String::chr('d');

        case 12: return String::chr('e');
		case 13: return String::chr('i');
		case 14: return String::chr('g');
	}
	return String::chr('r');         // Default is rock just in case
}
   
String Arps::chooseWinner(String playerChoice, String computerChoice) {
    String result;
    if (playerChoice == computerChoice) {
        result = "youTied";

    //Rock
    } else if (playerChoice == "r") { 
        if(computerChoice == "f" || computerChoice == "s" || computerChoice == "n" || computerChoice == "h" || computerChoice == "t" || computerChoice == "l" || computerChoice == "o") {
            result = "youWin";
        }
        else result = "youLose";
    } 
    //Fire
    else if (playerChoice == "f") { 
        if(computerChoice == "s" || computerChoice == "n" || computerChoice == "h" || computerChoice == "t" || computerChoice == "l" || computerChoice == "o" || computerChoice == "p"  ) {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Scissors
    else if (playerChoice == "s") { 
        if(computerChoice == "n" || computerChoice == "h" || computerChoice == "t" || computerChoice == "l" || computerChoice == "o" || computerChoice == "p" || computerChoice == "a") {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Snake
    else if (playerChoice == "n") { 
        if(computerChoice == "h" || computerChoice == "t" || computerChoice == "l" || computerChoice == "o" || computerChoice == "p" || computerChoice == "a" || computerChoice == "w") {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Human
    else if (playerChoice == "h") { 
        if(computerChoice == "t" || computerChoice == "l" || computerChoice == "o" || computerChoice == "p" || computerChoice == "a" || computerChoice == "w" || computerChoice == "d") {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Tree
    else if (playerChoice == "t") { 
        if(computerChoice == "l" || computerChoice == "o" || computerChoice == "p" || computerChoice == "a" || computerChoice == "w" || computerChoice == "d" || computerChoice == "e") {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Wolf
    else if (playerChoice == "l") { 
        if(computerChoice == "o" || computerChoice == "p" || computerChoice == "a" || computerChoice == "w" || computerChoice == "d" || computerChoice == "e"|| computerChoice == "i") {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Sponge
    else if (playerChoice == "o") { 
        if(computerChoice == "p" || computerChoice == "a" || computerChoice == "w" || computerChoice == "d" || computerChoice == "e"|| computerChoice == "i" || computerChoice == "g") {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Paper
    else if (playerChoice == "p") { 
        if(computerChoice == "a" || computerChoice == "w" || computerChoice == "d" || computerChoice == "e"|| computerChoice == "i" || computerChoice == "g" || computerChoice == "r") {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Air
    else if (playerChoice == "a") { 
        if(computerChoice == "w" || computerChoice == "d" || computerChoice == "e"|| computerChoice == "i" || computerChoice == "g" || computerChoice == "r" || computerChoice == "f") {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Water
    else if (playerChoice == "w") { 
        if(computerChoice == "d" || computerChoice == "e"|| computerChoice == "i" || computerChoice == "g" || computerChoice == "r" || computerChoice == "f" || computerChoice == "s" ) {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Dragon
    else if (playerChoice == "d") { 
        if(computerChoice == "e"|| computerChoice == "i" || computerChoice == "g" || computerChoice == "r" || computerChoice == "f" || computerChoice == "s" || computerChoice == "n" ) {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Devil
    else if (playerChoice == "e") { 
        if(computerChoice == "i" || computerChoice == "g" || computerChoice == "r" || computerChoice == "f" || computerChoice == "s" || computerChoice == "n" || computerChoice == "h" ) {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Lightning
    else if (playerChoice == "i") { 
        if(computerChoice == "g" || computerChoice == "r" || computerChoice == "f" || computerChoice == "s" || computerChoice == "n" || computerChoice == "h" || computerChoice == "t") {
            result = "youWin";
        }
        else result = "youLose";
    }
    //Gun
    else if (playerChoice == "g") { 
        if(computerChoice == "r" || computerChoice == "f" || computerChoice == "s" || computerChoice == "n" || computerChoice == "h" || computerChoice == "t" || computerChoice == "l") {
            result = "youWin";
        }
        else result = "youLose";
    }

    return result;
}
