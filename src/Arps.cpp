#include "Arps.h"
#include <godot_cpp/core/class_db.hpp>
#include <ctime>

void Arps::_bind_methods(){
    ClassDB::bind_method(D_METHOD("add", "value"), &Arps::add);
    ClassDB::bind_method(D_METHOD("reset"), &Arps::reset);
    ClassDB::bind_method(D_METHOD("get_total"), &Arps::get_total);
}

char Arps::getUserChoice(){
    char player;
	std::cout << "Rock-Paper-Scissors Game!\n";             // Placeholder

	do {                                                    // Placeholder, should be onscreen button presses not keyboard input
		std::cout << "Choose one of the following\n";
		std::cout << "*************************\n";
		std::cout << "'r' for rock\n";                      
		std::cout << "'p' for paper\n";
		std::cout << "'s' for scissors\n";

		std::cout << "'f' for fire\n";
		std::cout << "'n' for snake\n";
		std::cout << "'h' for human\n";

		std::cout << "'t' for tree\n";
		std::cout << "'l' for wolf\n";
		std::cout << "'o' for sponge\n";

		std::cout << "'a' for air\n";
		std::cout << "'w' for water\n";
		std::cout << "'d' for dragon\n";
        
		std::cout << "'e' for devil\n";
		std::cout << "'i' for lightning\n";
		std::cout << "'g' for gun\n";
		std::cin >> player;
	} while(player != 'r' && player != 'p' && player != 's'
        && player != 'f' && player != 'n' && player != 'h'
        && player != 't' && player != 'l' && player != 'o'
        && player != 'a' && player != 'w' && player != 'd'
        && player != 'e' && player != 'i' && player != 'g'
    );

	return player;    
}
char Arps::getComputerChoice(){
    srand(time(0));                     // We use time to generate a pseudo random choice
	int num = rand() % 15 + 1;           // Stores a num from 1-15. TODO: change accordingly

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
	return 0;
}

void Arps::showChoice(char choice){           // May or may not be necessary in final, very temp
	switch(choice){
		case 'r': std::cout << "Rock\n";
		break;
		case 'p': std::cout << "Paper\n";
		break;
		case 's': std::cout << "Scissors\n";
		break;

        case 'f': std::cout << "Fire\n";
		break;
		case 'n': std::cout << "Snake\n";
		break;
		case 'h': std::cout << "Human\n";
		break;

        case 't': std::cout << "Tree\n";
		break;
		case 'l': std::cout << "Wolf\n";
		break;
		case 'o': std::cout << "Sponge\n";
		break;

        case 'a': std::cout << "Air\n";
		break;
		case 'w': std::cout << "Water\n";
		break;
		case 'd': std::cout << "Dragon\n";
		break;

        case 'e': std::cout << "Devil\n";
		break;
		case 'i': std::cout << "Lightning\n";
		break;
		case 'g': std::cout << "Gun\n";
		break;
	}
}

void Arps::chooseWinner(char player, char computer) const{
    switch(player){
        //rock
		case 'r': 	
            if(computer == 'r'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'p' || computer == 'a' || computer == 'w'
                || computer == 'd' || computer == 'e' || computer == 'i' || computer == 'g') {
                std::cout << "You lose!\n";
            } else if(computer == 'f' || computer == 's' || computer == 'n' 
                || computer == 'h' || computer == 't' || computer == 'l' || computer == 'o'){
                std::cout << "You win!\n";
            }
			break;

        //fire
		case 'f': 	
            if(computer == 'f'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'r' || computer == 'a' || computer == 'w'
                || computer == 'd' || computer == 'e' || computer == 'i' || computer == 'g') {
                std::cout << "You lose!\n";
            } else if(computer == 'p' || computer == 's' || computer == 'n' 
                || computer == 'h' || computer == 't' || computer == 'l' || computer == 'o'){
                std::cout << "You win!\n";
            }
			break;

        //scissors
		case 's': 	
            if(computer == 's'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'r' || computer == 'f' || computer == 'w'
                || computer == 'd' || computer == 'e' || computer == 'i' || computer == 'g') {
                std::cout << "You lose!\n";
            } else if(computer == 'p' || computer == 'a' || computer == 'n' 
                || computer == 'h' || computer == 't' || computer == 'l' || computer == 'o'){
                std::cout << "You win!\n";
            }
			break;

        //snake
		case 'n': 	
            if(computer == 'n'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'r' || computer == 'f' || computer == 's'
                || computer == 'd' || computer == 'e' || computer == 'i' || computer == 'g') {
                std::cout << "You lose!\n";
            } else if(computer == 'p' || computer == 'a' || computer == 'w' 
                || computer == 'h' || computer == 't' || computer == 'l' || computer == 'o'){
                std::cout << "You win!\n";
            }
			break;

		//human
		case 'h': 	
            if(computer == 'h'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'r' || computer == 'f' || computer == 's'
                || computer == 'n' || computer == 'e' || computer == 'i' || computer == 'g') {
                std::cout << "You lose!\n";
            } else if(computer == 'p' || computer == 'a' || computer == 'w' 
                || computer == 'd' || computer == 't' || computer == 'l' || computer == 'o'){
                std::cout << "You win!\n";
            }
			break;

		//tree
		case 't': 	
            if(computer == 't'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'r' || computer == 'f' || computer == 's'
                || computer == 'n' || computer == 'h' || computer == 'i' || computer == 'g') {
                std::cout << "You lose!\n";
            } else if(computer == 'p' || computer == 'a' || computer == 'w' 
                || computer == 'd' || computer == 'e' || computer == 'l' || computer == 'o'){
                std::cout << "You win!\n";
            }
			break;

		//wolf
		case 'l': 	
            if(computer == 'l'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'r' || computer == 'f' || computer == 's'
                || computer == 'n' || computer == 'h' || computer == 't' || computer == 'g') {
                std::cout << "You lose!\n";
            } else if(computer == 'p' || computer == 'a' || computer == 'w' 
                || computer == 'd' || computer == 'e' || computer == 'i' || computer == 'o'){
                std::cout << "You win!\n";
            }
			break;

		//sponge
		case 'o': 	
            if(computer == 'o'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'r' || computer == 'f' || computer == 's'
                || computer == 'n' || computer == 'h' || computer == 't' || computer == 'l') {
                std::cout << "You lose!\n";
            } else if(computer == 'p' || computer == 'a' || computer == 'w' 
                || computer == 'd' || computer == 'e' || computer == 'i' || computer == 'g'){
                std::cout << "You win!\n";
            }
			break;

		//sponge
		case 'p': 	
            if(computer == 'p'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'o' || computer == 'f' || computer == 's'
                || computer == 'n' || computer == 'h' || computer == 't' || computer == 'l') {
                std::cout << "You lose!\n";
            } else if(computer == 'r' || computer == 'a' || computer == 'w' 
                || computer == 'd' || computer == 'e' || computer == 'i' || computer == 'g'){
                std::cout << "You win!\n";
            }
			break;
		
		//air
		case 'a': 	
            if(computer == 'a'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'o' || computer == 'p' || computer == 's'
                || computer == 'n' || computer == 'h' || computer == 't' || computer == 'l') {
                std::cout << "You lose!\n";
            } else if(computer == 'r' || computer == 'f' || computer == 'w' 
                || computer == 'd' || computer == 'e' || computer == 'i' || computer == 'g'){
                std::cout << "You win!\n";
            }
			break;

		//water
		case 'w': 	
            if(computer == 'w'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'o' || computer == 'p' || computer == 'a'
                || computer == 'n' || computer == 'h' || computer == 't' || computer == 'l') {
                std::cout << "You lose!\n";
            } else if(computer == 'r' || computer == 'f' || computer == 's' 
                || computer == 'd' || computer == 'e' || computer == 'i' || computer == 'g'){
                std::cout << "You win!\n";
            }
			break;

		//dragon
		case 'd': 	
            if(computer == 'd'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'o' || computer == 'p' || computer == 'a'
                || computer == 'w' || computer == 'h' || computer == 't' || computer == 'l') {
                std::cout << "You lose!\n";
            } else if(computer == 'r' || computer == 'f' || computer == 's' 
                || computer == 'n' || computer == 'e' || computer == 'i' || computer == 'g'){
                std::cout << "You win!\n";
            }
			break;
		
		//devil
		case 'e': 	
            if(computer == 'e'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'o' || computer == 'p' || computer == 'a'
                || computer == 'w' || computer == 'd' || computer == 't' || computer == 'l') {
                std::cout << "You lose!\n";
            } else if(computer == 'r' || computer == 'f' || computer == 's' 
                || computer == 'n' || computer == 'h' || computer == 'i' || computer == 'g'){
                std::cout << "You win!\n";
            }
			break;
		
		//lightning
		case 'i': 	
            if(computer == 'i'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'o' || computer == 'p' || computer == 'a'
                || computer == 'w' || computer == 'd' || computer == 'e' || computer == 'l') {
                std::cout << "You lose!\n";
            } else if(computer == 'r' || computer == 'f' || computer == 's' 
                || computer == 'n' || computer == 'h' || computer == 't' || computer == 'g'){
                std::cout << "You win!\n";
            }
			break;

		//gun
		case 'g': 	
            if(computer == 'g'){
                std::cout << "It's a tie!\n";
            } else if (computer == 'o' || computer == 'p' || computer == 'a'
                || computer == 'w' || computer == 'd' || computer == 'e' || computer == 'i') {
                std::cout << "You lose!\n";
            } else if(computer == 'r' || computer == 'f' || computer == 's' 
                || computer == 'n' || computer == 'h' || computer == 't' || computer == 'l'){
                std::cout << "You win!\n";
            }
			break;
	}
}
