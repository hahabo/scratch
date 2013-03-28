#include <stdio.h>

long algo (long n)
{
  long count = 1;
#ifdef NONO
  printf ("%ld ", n);
#endif
  while (n != 1) {
    if (n % 2)
      n = 3*n + 1;
    else
      n = n/2;
#ifdef NONO
    printf ("%ld ", n);
#endif
    ++count;
  }
#ifdef NONO
  printf ("\n");
#endif
  return count;
}

int main ()
{
  long i, j, x, y, y_max, lower, upper;
  long res;
  while ((res = scanf ("%ld %ld", &i, &j)) != EOF) {
    if (res == 0) break;
    y_max = 0;
    if (i > j) {
      upper = i;
      lower = j;
    } else {
      upper = j;
      lower = i;
    }
    for (x = lower; x <= upper; ++x) {
      y = algo (x);
      if (y > y_max)
	y_max = y;
#ifdef NONO
      printf ("%ld -> %ld\n", x, y);
#endif
    }
    printf ("%ld %ld %ld\n", i, j, y_max);
  }
  return 0;
}
