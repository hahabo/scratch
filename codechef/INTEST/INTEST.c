#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  unsigned n, k, t, count = 0;

  scanf("%d %d", &n, &k);

  while (scanf("%d", &t) != EOF)
    if (t % k == 0) count++;

  printf("%d\n", count);

  return 0;
}
