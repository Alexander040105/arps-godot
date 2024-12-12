#include "Arps.h"
#include <godot_cpp/core/class_db.hpp>
#include <cstdlib>
#include <ctime>

void Arps::_bind_methods(){
    ClassDB::bind_method(D_METHOD("start_game", "choice"), &Arps::start_game);
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
    } else if   ((playerChoice == 'r' && computerChoice == 's') ||
                (playerChoice == 'r' && computerChoice == 'f') ||
                (playerChoice == 'r' && computerChoice == 'n') ||
                (playerChoice == 'r' && computerChoice == 'h') ||
                (playerChoice == 'r' && computerChoice == 't') ||
                (playerChoice == 'r' && computerChoice == 'l') ||
                (playerChoice == 'r' && computerChoice == 'o') ||

                (playerChoice == 'p' && computerChoice == 'r') ||
                (playerChoice == 's' && computerChoice == 'p')) {
        UtilityFunctions::print("You win!");
    } else {
        UtilityFunctions::print("You lose!");
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
