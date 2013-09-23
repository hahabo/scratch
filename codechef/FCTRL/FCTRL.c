#include <stdio.h>
#include <stdlib.h>

long z(long n)
{
  long z = n / 5;
  long x = z;
  while(x > 0) {
    x = x / 5;
    z += x;
  }
  return z;
}

int main(int argc, char *argv[])
{
  long t, n;
  scanf("%ld", &t);
  while(scanf("%ld", &n) != EOF)
    printf("%ld\n", z(n));
  return 0;
}
