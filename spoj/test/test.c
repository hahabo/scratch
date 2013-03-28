#include <stdio.h>

int main ()
{
  int x, result;
  while ((result = scanf ("%d", &x)) != EOF) {
    if (result == 0 || x == 42) break;
    printf ("%d\n", x);
  }
  return 0;
}
