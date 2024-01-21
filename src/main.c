#include "../include/main.h"

#include <time.h>

#include "../include/defs.h"
#include "../include/main.h"
#include "../include/utils.h"
#include "../include/main.h"

int main(void) {
    // Set the charset to Mixed Upper/Lowercase
    iocharmap(IOCHM_PETSCII_2);
    Game game = {
        .state = STATE_MAIN_MENU,
        .secretNumber = 0,
        .attempts = 0,
        .maxAttempts = 0,
        .min = 0,
        .max = 0,
        .difficulty = DIFFICULTY_MEDIUM,
    };

    MainMenuChoice choice;
    do {
        switch (game.state) {
            case STATE_MAIN_MENU:
                processMainMenu(&game);
                break;
            case STATE_DIFFICULTY_MENU:
                processDifficultyMenu(&game);
                break;
            case STATE_GAME:
                playGame(&game);
                game.state = STATE_MAIN_MENU;
                break;
            case STATE_HIGH_SCORES:
                highScores();
                game.state = STATE_MAIN_MENU;
                break;
            case STATE_EXIT:
                exitGame();
                break;
            default:
                break;
        }
    } while (game.state != STATE_EXIT);
    // Set the charset back to Uppercase
    iocharmap(IOCHM_PETSCII_1);
    clrscr();
    return 0;
}

Game *newGame() {
    Game *game = malloc(sizeof(Game));
    initGame(game);
    return game;
}

void initGame(Game *game) {
    // Ask Player for name?
    game->min = 1;
    game->max = 100;
    game->secretNumber = generateSecretNumber(game->min, game->max);
    game->attempts = 0;
}

int generateSecretNumber(int min, int max) {
    srand(clock());
    return rand() % (max - min + 1) + min;
}

void processMainMenu(Game *game) {
    MainMenuChoice choice = mainMenu();
    switch (choice) {
        case CHOICE_NEW_GAME:
            game->state = STATE_GAME;
            initGame(game);  // Initialize the game
            break;
        case CHOICE_DIFFICULTY_MENU:
            game->state = STATE_DIFFICULTY_MENU;
            break;
        case CHOICE_EXIT:
            game->state = STATE_EXIT;
            break;
        default:
            break;
    }
}

MainMenuChoice mainMenu() {
    int choice = 0;
    char choices[MAIN_MENU_CHOICE_SIZE][MAX_STRING_SIZE] = {
        "New Game",
        "Difficulty",
        // "High Scores",
        "Exit",
    };
    printf("Main Menu\n");
    printLine('-', 9);
    printf("Welcome to Hi-Lo!\n");
    do {
        for (int i = 0; i < MAIN_MENU_CHOICE_SIZE; i++) {
            printf("%d. %s\n", i + 1, choices[i]);
        }
        choice = askForNumber("Choice: ");
        printf("\n");
    } while (choice < 1 || choice > MAIN_MENU_CHOICE_SIZE);
    return choice - 1;
}

void processDifficultyMenu(Game *game) {
    DifficultyChoice choice = difficultyMenu();
    switch (choice) {
        case DIFFICULTY_EASY:
            setDifficulty(game, DIFFICULTY_EASY);
            break;
        case DIFFICULTY_MEDIUM:
            setDifficulty(game, DIFFICULTY_MEDIUM);
            break;
        case DIFFICULTY_HARD:
            setDifficulty(game, DIFFICULTY_HARD);
            break;
        default:
            break;
    }
    game->state = STATE_MAIN_MENU;
}

DifficultyChoice difficultyMenu() {
    int choice = 0;
    char choices[DIFFICULTY_MENU_SIZE][MAX_STRING_SIZE] = {
        "Easy (15 attempts)",
        "Medium (10 attempts)",
        "Hard (5 attempts)",
    };
    printf("Difficulty\n");
    printLine('-', 10);
    do {
        for (int i = 0; i < DIFFICULTY_MENU_SIZE; i++) {
            printf("%d. %s\n", i + 1, choices[i]);
        }
        choice = askForNumber("Choice: ");
        printf("\n");
    } while (choice < 1 || choice > DIFFICULTY_MENU_SIZE);
    return choice - 1;
}

void printLine(char character, int length) {
    for (int i = 0; i < length; i++) {
        printf("%c", character);
    }
    printf("\n");
}

// TODO: Make "I'm thinking of a number between %d and %d" wrap to
//       the next line as it's too long.

int playGame(Game *game) {
    int guess = 0;
    bool hints = false;
    if (game->difficulty == DIFFICULTY_EASY) {
        hints = true;
    }
    printf("I'm thinking of a number between \n");
    printf("%d and %d.\n", game->min, game->max);

    char *attempt_status = malloc(sizeof(char) * 20);
    char *promptMessage = malloc(sizeof(char) * 20);
    do {
        if (game->attempts > 0) {
            printf("\n");
            printf("Guess again!\n");
            printf("\n");
        }
        playGamePrintCurrentGuessNumber(attempt_status, game);
        playGameAlterPrompt(game, hints, promptMessage);
        guess = askForNumber(promptMessage);
        game->attempts++;
        playGameLogic(guess, game);
    } while (guess != game->secretNumber && game->attempts < game->maxAttempts);
    return playGameCheckWin(guess, game);
}

void playGameLogic(int guess, Game *game) {
    if (guess < game->secretNumber) {
        printf("Too low!\n");
        game->min = guess + 1;
    } else if (guess > game->secretNumber) {
        printf("Too high!\n");
        game->max = guess - 1;
    }
}

int playGameCheckWin(int guess, Game *game) {
    if (guess == game->secretNumber) {
        printf("You guessed it in %d attempts!\n", game->attempts);
        return game->attempts;
    } else {
        printf("You ran out of attempts!\n");
        return -1;
    }
}

void playGamePrintCurrentGuessNumber(char *attempt_status, Game *game) {
    sprintf(
        attempt_status,
        "Guess %d of %d\n",
        game->attempts + 1,
        game->maxAttempts
    );
    printf(attempt_status);
    int number_of_dashes = strlen(attempt_status) - 1;
    printLine('-', number_of_dashes);
}

void playGameAlterPrompt(Game *game, bool hints, char *promptMessage) {
    // If the difficulty is easy, and if the player is guessing
    // for the first time, display the range of numbers.
    if (game->attempts == 0 && hints == true) {
        sprintf(
            promptMessage,
            "Guess a number between %d and %d: ",
            game->min,
            game->max
        );
    } else {
        sprintf(promptMessage, "Your guess: ");
    }
}

void highScores() {
    printf("High Scores\n");
}

void exitGame() {
    printf("Exiting...\n");
}
