#include <stdio.h>
#include <math.h>

int is_prime (int x)
{
  int i;
  int bound = sqrt (x);
  if (x == 2)
    return 1;
  for (i = 3; i <= bound; i+=2) {
    if (x % i == 0)
      return 0;
  }
  return 1;
}

int main ()
{
  int total_case;
  int m, n;
  int result;
  int i;

  scanf ("%d", &total_case);
  while ((result = scanf ("%d %d", &m, &n)) != EOF) {
    if (result == 0) break;
    if (m > 2 && m % 2 == 0) ++m;
    for (i = m; i <= n; i+=2) {
      if (is_prime (i))
	printf ("%d\n", i);
    }
    printf ("\n");
  }
  return 0;
}
