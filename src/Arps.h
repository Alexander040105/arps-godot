#pragma once
#include <godot_cpp/classes/control.hpp>
#include <godot_cpp/classes/node.hpp>
#include <godot_cpp/classes/texture_rect.hpp>
#include <godot_cpp/variant/utility_functions.hpp>

using namespace godot;

class Arps : public Control{
    GDCLASS(Arps, Control);

protected: 
    static void _bind_methods();

private:
    String playerChoice;
    String computerChoice;

public:
    Arps();
    ~Arps();

    String getComputerChoice();                                               
    String chooseWinner();
    void showResult(const String &resultName);

};
