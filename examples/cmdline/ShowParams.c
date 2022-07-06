#include "stdafx.h"
int main(int argc, char* argv[])
{
  for (int i = 0; i < argc; ++i)
  {
    printf("param %d = ",i);
    puts(argv[i]);
    printf("\n");
  }
  return 0;
}