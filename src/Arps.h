#pragma once
#include <godot_cpp/classes/object.hpp>

using namespace godot;

class Arps : public Object{
    GDCLASS(Arps, Object);

protected: 
    static void _bind_methods();

private:
    char playerChoice;
    char computerChoice;

    char getUserChoice(const String &choice);
    char getComputerChoice();                           
    void showChoice(char choice);                       
    void chooseWinner(char player, char computer);

public:
    Arps();
    ~Arps();

    void start_game(const String &choice);  // Just for printing to terminal
};