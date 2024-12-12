#pragma once
#include <godot_cpp/classes/object.hpp>

using namespace godot;

class Arps : public Object{
    GDCLASS(Arps, Object);

protected: 
    static void _bind_methods();

private:
    String playerChoice;
    String computerChoice;
    String result;

    String getComputerChoice();                                               
    String chooseWinner();

public:
    Arps();
    ~Arps();
};