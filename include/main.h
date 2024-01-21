#ifndef MAIN
#define MAIN

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <conio.h>

typedef enum {
    STATE_MAIN_MENU,
    STATE_DIFFICULTY_MENU,
    STATE_GAME,
    STATE_HIGH_SCORES,
    STATE_EXIT,
} GameState;

typedef enum {
    CHOICE_NEW_GAME,
    CHOICE_DIFFICULTY_MENU,
    // HIGH_SCORES,
    CHOICE_EXIT,
    MAIN_MENU_CHOICE_SIZE
} MainMenuChoice;

typedef enum {
    DIFFICULTY_EASY,
    DIFFICULTY_MEDIUM,
    DIFFICULTY_HARD,
    DIFFICULTY_MENU_SIZE
} DifficultyChoice;

typedef struct {
    char name[20];
    int score;
} Player;

typedef struct {
    Player *players;
    int size;
} HighScores;

typedef struct {
    Player player;
    DifficultyChoice difficulty;
    GameState state;
    int secretNumber;
    int attempts;
    int maxAttempts;
    int min;
    int max;
} Game;

//**
//* @brief Displays the main menu, and calls the appropriate
//*        function for each menu item.
//* @param game The game object.
//*/
void processMainMenu(Game *game);

//**
//* @brief Displays the difficulty menu, and sets the game's
//*        difficulty.
//* @param game The game object.
//*/
void processDifficultyMenu(Game *game);

void setDifficulty(Game *game, DifficultyChoice difficulty);

//**
//* @brief Displays the main menu, gets the user's choice,
//*        and returns it.
//* @return The user's choice.
MainMenuChoice mainMenu();

//**
//* @brief Displays the difficulty menu, gets the user's choice,
//*        and returns it.
//* @return The user's choice.
DifficultyChoice difficultyMenu();

//**
//* @brief Creates a new Game object and calls the
//*        initialization function.
//* @return The created Game object.
Game *newGame();

//**
//* @brief Initializes the Game object. This means we can start a new
//*        game without having to create a new Game object.
//* @param game The Game object to initialize.
void initGame(Game *game);

//**
//* @brief Displays the high scores. (Not implemented yet.)
//*/
void highScores();

//**
//* @brief Exits the game.
//*/
void exitGame();

//**
//* @brief Gets the player's name.
//* @param game The Game object.
//*/

//**
//* @brief Prints a customisable line of characters.
//* @param character The character to print.
//* @param length The length of the line.
//*/
void printLine(char character, int length);

//**
//* @brief Generates a random number between min and max.
//* @param min The minimum value.
//* @param max The maximum value.
//* @return The generated number.
int generateSecretNumber(int min, int max);

//**
//* @brief Plays the game.
//* @param game The Game object.
//* @return The number of attempts the player made (if they won,
//*         otherwise -1).
int playGame(Game *game);
void playGameLogic(int guess, Game *game);
int playGameCheckWin(int guess, Game *game);
void playGamePrintCurrentGuessNumber(char *attempt_status, Game *game);
void playGameAlterPrompt(Game *game, bool hints, char *promptMessage);
#endif /* MAIN */
