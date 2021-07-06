#include<stdio.h>
#include<ctype.h>

int main(void) {
  int command;
  while((command = getchar()) != EOF) 
  {
    switch (command)
    {
    case 'h':
      printf("help");
      break;
    case 'q':
      exit(0);
      break;
    default:
      printf("Unexpected input %d (0x%.2X) ('%c')\n", command, command, isgraph(command) ? command : '.');
      break;
    }
    return 0;
  }
}