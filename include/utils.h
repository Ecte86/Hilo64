#ifndef UTILS_H
#define UTILS_H

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

char askForChar(const char *message);
int askForNumber(const char *message);
bool askYesOrNoQuestion(const char *message, const char *yesMsg, const char *noMsg, bool yesIsTrue);


#endif // UTILS_H
