#include "../include/defs.h"
#include "../include/utils.h"
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int askForNumber(const char *message) {
    int number = 0;
    printf("%s", message);
    scanf("%d", &number);
    printf("\n");
    return number;
}

char askForChar(const char *message) {
    char character = 0;
    printf("%s", message);
    scanf("%c", &character);
    printf("\n");
    return character;
}

bool askYesOrNoQuestion(const char *message, const char *yes, const char *no, bool yesIsTrue) {
    const int YES = 0; const int NO = 1; const int INVALID = -1;
    char *string = malloc(MAX_STRING_SIZE*sizeof(char));
    int response = INVALID;
    printf("%s", message);
    scanf("%s", string);
    printf("\n");
    do {
        if (strcmp(string, yes) == 0) {
            response = YES;
        } else if (strcmp(string, no) == 0) {
            response = NO;
        } else {
            printf("Invalid input. Please try again.\n");
            response = INVALID;
        }
    } while (response == INVALID);
    if (response == YES) {
        return yesIsTrue;
    } else {
        return !yesIsTrue;
    }
}
