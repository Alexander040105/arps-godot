#include "Arps.h"
#include <godot_cpp/core/class_db.hpp>
#include <cstdlib>
#include <ctime>

void Arps::_bind_methods(){
    ClassDB::bind_method(D_METHOD("start_game", "choice"), &Game::start_game);
}

Arps::Arps() {
    std::srand(std::time(nullptr)); // Initialize random seed
}

Arps::~Arps() {}

char Arps::getUserChoice(const String &choice){
    // Convert Godot string input to char
    return choice.utf8().get_data()[0];    
}

char Arps::getComputerChoice(){
    int num = std::rand() % 15; // Generate a number between 0 and 14

	switch(num){                        // Note that the Comp choice is a num, not r p or s; case should be num
        // TODO: Increase number of cases for each choice
		case 1: return 'r';
		case 2: return 'p';
		case 3: return 's';

        case 4: return 'f';
		case 5: return 'n';
		case 6: return 'h';

        case 7: return 't';
		case 8: return 'l';
		case 9: return 'o';

        case 10: return 'a';
		case 11: return 'w';
		case 12: return 'd';

        case 13: return 'e';
		case 14: return 'i';
		case 15: return 'g';
	}
	return 'r';         // Default is rock just in case
}


void Arps::showChoice(char choice){           // May or may not be necessary in final, very temp
	switch(choice){
		case 'r': UtilityFunctions::print("Rock"); break;
		case 'p': UtilityFunctions::print("Paper"); break;
        case 's': UtilityFunctions::print("Scissors"); break;

        case 'f': UtilityFunctions::print("Fire"); break;
		case 'n': UtilityFunctions::print("Snake"); break;
		case 'h': UtilityFunctions::print("Human"); break;

        case 't': UtilityFunctions::print("Tree"); break;
		case 'l': UtilityFunctions::print("Wolf"); break;
		case 'o': UtilityFunctions::print("Sponge"); break;

        case 'a': UtilityFunctions::print("Air"); break;
		case 'w': UtilityFunctions::print("Water"); break;
		case 'd': UtilityFunctions::print("Dragon"); break;

        case 'e': UtilityFunctions::print("Devil"); break;
		case 'i': UtilityFunctions::print("Lightning"); break;
		case 'g': UtilityFunctions::print("Gun"); break;
	}
}

void Arps::chooseWinner() {
    if (playerChoice == computerChoice) {
        UtilityFunctions::print("It's a tie!");

    //Rock
    } else if (playerChoice == 'r') { 
        if(computerChoice == 'f' || computerChoice == 's' || computerChoice == 'n' || computerChoice == 'h' || computerChoice == 't' || computerChoice == 'l' || computerChoice == 'o') {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    } 
    //Fire
    else if (playerChoice == 'f') { 
        if(computerChoice == 's' || computerChoice == 'n' || computerChoice == 'h' || computerChoice == 't' || computerChoice == 'l' || computerChoice == 'o' || computerChoice == 'p'  ) {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Scissors
    else if (playerChoice == 's') { 
        if(computerChoice == 'n' || computerChoice == 'h' || computerChoice == 't' || computerChoice == 'l' || computerChoice == 'o' || computerChoice == 'p' || computerChoice == 'a') {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Snake
    else if (playerChoice == 'n') { 
        if(computerChoice == 'h' || computerChoice == 't' || computerChoice == 'l' || computerChoice == 'o' || computerChoice == 'p' || computerChoice == 'a' || computerChoice == 'w') {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Human
    else if (playerChoice == 'h') { 
        if(computerChoice == 't' || computerChoice == 'l' || computerChoice == 'o' || computerChoice == 'p' || computerChoice == 'a' || computerChoice == 'w' || computerChoice == 'd') {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Tree
    else if (playerChoice == 't') { 
        if(computerChoice == 'l' || computerChoice == 'o' || computerChoice == 'p' || computerChoice == 'a' || computerChoice == 'w' || computerChoice == 'd' || computerChoice == 'e') {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Wolf
    else if (playerChoice == 'l') { 
        if(computerChoice == 'o' || computerChoice == 'p' || computerChoice == 'a' || computerChoice == 'w' || computerChoice == 'd' || computerChoice == 'e'|| computerChoice == 'i') {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Sponge
    else if (playerChoice == 'o') { 
        if(computerChoice == 'p' || computerChoice == 'a' || computerChoice == 'w' || computerChoice == 'd' || computerChoice == 'e'|| computerChoice == 'i' || computerChoice == 'g') {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Paper
    else if (playerChoice == 'p') { 
        if(computerChoice == 'a' || computerChoice == 'w' || computerChoice == 'd' || computerChoice == 'e'|| computerChoice == 'i' || computerChoice == 'g' || computerChoice == 'r') {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Air
    else if (playerChoice == 'a') { 
        if(computerChoice == 'w' || computerChoice == 'd' || computerChoice == 'e'|| computerChoice == 'i' || computerChoice == 'g' || computerChoice == 'r' || computerChoice == 'f') {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Water
    else if (playerChoice == 'w') { 
        if(computerChoice == 'd' || computerChoice == 'e'|| computerChoice == 'i' || computerChoice == 'g' || computerChoice == 'r' || computerChoice == 'f' || computerChoice == 's' ) {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Dragon
    else if (playerChoice == 'd') { 
        if(computerChoice == 'e'|| computerChoice == 'i' || computerChoice == 'g' || computerChoice == 'r' || computerChoice == 'f' || computerChoice == 's' || computerChoice == 'n' ) {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Devil
    else if (playerChoice == 'e') { 
        if(computerChoice == 'i' || computerChoice == 'g' || computerChoice == 'r' || computerChoice == 'f' || computerChoice == 's' || computerChoice == 'n' || computerChoice == 'h' ) {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Devil
    else if (playerChoice == 'i') { 
        if(computerChoice == 'g' || computerChoice == 'r' || computerChoice == 'f' || computerChoice == 's' || computerChoice == 'n' || computerChoice == 'h' || computerChoice == 't') {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    //Gun
    else if (playerChoice == 'g') { 
        if(computerChoice == 'r' || computerChoice == 'f' || computerChoice == 's' || computerChoice == 'n' || computerChoice == 'h' || computerChoice == 't' || computerChoice == 'l') {
            UtilityFunctions::print("You win!");
        }
        else {UtilityFunctions::print("You lose!");}
    }
    
}

void Game::start_game(const String &choice) {
    player_choice = get_user_choice(choice);
    UtilityFunctions::print("Player choice:");
    show_choice(player_choice);

    computer_choice = get_computer_choice();
    UtilityFunctions::print("Computer choice:");
    show_choice(computer_choice);

    choose_winner();
}
