#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  int x;
  double y;
  double bank_charge = 0.5;

  scanf("%d %lf", &x, &y);

  /* printf("%d %.2f\n", x, y); */

  if (x % 5) {
    printf("%.2f\n", y);
    exit(0);
  }

  if (x + bank_charge <= y) {
    printf("%.2f\n", y - (x + bank_charge));
  } else {
    printf("%.2f\n", y);
  }

  return 0;
}
