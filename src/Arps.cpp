#include "Arps.h"
#include <godot_cpp/core/class_db.hpp>
#include <cstdlib>
#include <ctime>

void Arps::_bind_methods() {
    ClassDB::bind_method(D_METHOD("getComputerChoice"), &Arps::getComputerChoice);
    ClassDB::bind_method(D_METHOD("chooseWinner"), &Arps::chooseWinner);
}

Arps::Arps() {
    std::srand(std::time(nullptr)); // Initialize random seed
}

Arps::~Arps() {}

String Arps::getComputerChoice(){
    int num = std::rand() % 15; // Generate a number between 0 and 14

	switch(num){                      
		case 1: return String::chr('r');
		case 2: return String::chr('p');
		case 3: return String::chr('s');

        case 4: return String::chr('f');
		case 5: return String::chr('n');
		case 6: return String::chr('h');

        case 7: return String::chr('t');
		case 8: return String::chr('l');
		case 9: return String::chr('o');

        case 10: return String::chr('a');
		case 11: return String::chr('w');
		case 12: return String::chr('d');

        case 13: return String::chr('e');
		case 14: return String::chr('i');
		case 15: return String::chr('g');
	}
	return String::chr('r');;         // Default is rock just in case
}
   
String Arps::chooseWinner() {
    if (playerChoice == computerChoice) {
        return String::chr('t');;

    //Rock
    } else if (playerChoice == 'r') { 
        if(computerChoice == 'f' || computerChoice == 's' || computerChoice == 'n' || computerChoice == 'h' || computerChoice == 't' || computerChoice == 'l' || computerChoice == 'o') {
            return String::chr('w');;
        }
        else return String::chr('l');;
    } 
    //Fire
    else if (playerChoice == 'f') { 
        if(computerChoice == 's' || computerChoice == 'n' || computerChoice == 'h' || computerChoice == 't' || computerChoice == 'l' || computerChoice == 'o' || computerChoice == 'p'  ) {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Scissors
    else if (playerChoice == 's') { 
        if(computerChoice == 'n' || computerChoice == 'h' || computerChoice == 't' || computerChoice == 'l' || computerChoice == 'o' || computerChoice == 'p' || computerChoice == 'a') {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Snake
    else if (playerChoice == 'n') { 
        if(computerChoice == 'h' || computerChoice == 't' || computerChoice == 'l' || computerChoice == 'o' || computerChoice == 'p' || computerChoice == 'a' || computerChoice == 'w') {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Human
    else if (playerChoice == 'h') { 
        if(computerChoice == 't' || computerChoice == 'l' || computerChoice == 'o' || computerChoice == 'p' || computerChoice == 'a' || computerChoice == 'w' || computerChoice == 'd') {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Tree
    else if (playerChoice == 't') { 
        if(computerChoice == 'l' || computerChoice == 'o' || computerChoice == 'p' || computerChoice == 'a' || computerChoice == 'w' || computerChoice == 'd' || computerChoice == 'e') {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Wolf
    else if (playerChoice == 'l') { 
        if(computerChoice == 'o' || computerChoice == 'p' || computerChoice == 'a' || computerChoice == 'w' || computerChoice == 'd' || computerChoice == 'e'|| computerChoice == 'i') {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Sponge
    else if (playerChoice == 'o') { 
        if(computerChoice == 'p' || computerChoice == 'a' || computerChoice == 'w' || computerChoice == 'd' || computerChoice == 'e'|| computerChoice == 'i' || computerChoice == 'g') {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Paper
    else if (playerChoice == 'p') { 
        if(computerChoice == 'a' || computerChoice == 'w' || computerChoice == 'd' || computerChoice == 'e'|| computerChoice == 'i' || computerChoice == 'g' || computerChoice == 'r') {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Air
    else if (playerChoice == 'a') { 
        if(computerChoice == 'w' || computerChoice == 'd' || computerChoice == 'e'|| computerChoice == 'i' || computerChoice == 'g' || computerChoice == 'r' || computerChoice == 'f') {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Water
    else if (playerChoice == 'w') { 
        if(computerChoice == 'd' || computerChoice == 'e'|| computerChoice == 'i' || computerChoice == 'g' || computerChoice == 'r' || computerChoice == 'f' || computerChoice == 's' ) {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Dragon
    else if (playerChoice == 'd') { 
        if(computerChoice == 'e'|| computerChoice == 'i' || computerChoice == 'g' || computerChoice == 'r' || computerChoice == 'f' || computerChoice == 's' || computerChoice == 'n' ) {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Devil
    else if (playerChoice == 'e') { 
        if(computerChoice == 'i' || computerChoice == 'g' || computerChoice == 'r' || computerChoice == 'f' || computerChoice == 's' || computerChoice == 'n' || computerChoice == 'h' ) {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Devil
    else if (playerChoice == 'i') { 
        if(computerChoice == 'g' || computerChoice == 'r' || computerChoice == 'f' || computerChoice == 's' || computerChoice == 'n' || computerChoice == 'h' || computerChoice == 't') {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
    //Gun
    else if (playerChoice == 'g') { 
        if(computerChoice == 'r' || computerChoice == 'f' || computerChoice == 's' || computerChoice == 'n' || computerChoice == 'h' || computerChoice == 't' || computerChoice == 'l') {
            return String::chr('w');;
        }
        else return String::chr('l');;
    }
}
