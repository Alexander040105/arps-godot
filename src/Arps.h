#pragma once
#include <godot_cpp/classes/object.hpp>

using namespace godot;

class Arps : public Object{
    GDCLASS(Arps, Object);

    int count;

protected: 
    static void _bind_methods();    // Dont change

public:
    char getUserChoice();
    char getComputerChoice();                           
    void showChoice(char choice);                       
    void chooseWinner(char player, char computer);
}