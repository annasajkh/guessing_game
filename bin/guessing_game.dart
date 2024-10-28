import 'dart:io';
import 'dart:convert';
import 'dart:math';

bool isNumeric(String string) {    
    return double.tryParse(string) != null;
}

String validateConfirmationInput() {
    String userInput = stdin.readLineSync(encoding: utf8) ?? "";
    
    while (userInput != "y" || userInput != "n") {
        stdout.write("Wrong Input! wanna play again? (y/n) ");
        userInput = stdin.readLineSync(encoding: utf8) ?? "";
    }

    return userInput;
}

void reset() {
    secretNumber = random.nextInt(10) + 1;
    attempts = 4;
}

Random random = Random();
int secretNumber = random.nextInt(10) + 1;
int attempts = 5;

void main() {
    String userGuessInput;
    
    while (true) {
        stdout.write("Guess the number between 1 - 10, You have $attempts attempts: ");
        userGuessInput = stdin.readLineSync(encoding: utf8) ?? "";


        if (attempts == 0) {
            stdout.write("You ran out of attempt, wanna play again? (y/n) ");
            String userPlayAgainInput = validateConfirmationInput();

            if (userPlayAgainInput == "n") {
                break;
            }
            
            reset();
            continue;
        }

        while (!isNumeric(userGuessInput)) {
            stdout.write("Input is not a number! Try again: ");
            userGuessInput = stdin.readLineSync(encoding: utf8) ?? "";
        }

        int guess = int.parse(userGuessInput); 

        if (guess < secretNumber) {
            print("The number is too small");
            attempts--;
        } else if (guess > secretNumber) {
            print("The number is too big");
            attempts--;
        } else if (guess == secretNumber) {
            stdout.write("You win! wanna play again? (y/n) ");
            String userPlayAgainInput = validateConfirmationInput();
            
            if (userPlayAgainInput == "n") {
                break;
            }

            reset();
        }
    }

    print("Thanks for playing my game");
}