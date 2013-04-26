#include <stdio.h>
#include <math.h>

#define MAX 10*10*10*10*10
int prime_cache[MAX];
int max_index;

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

/**********************************************/
/* This function will look for X in the array */
/* PRIME_CACHE and return 1 if found	      */
/**********************************************/
int binary_search (int x, int first_index, int last_index)
{
  int mid_index = (first_index+last_index)/2;
  int mid = prime_cache[mid_index];
  if (first_index > last_index)
    return 0;
  if (x < mid)
    return binary_search (x, first_index, mid_index-1);
  else if (x > mid)
    return binary_search (x, mid_index+1, last_index);
  else
    return 1;
}

int is_prime_cache (int x)
{
  int i;
  int bound = sqrt (x);
  if (x < MAX)
    return binary_search (x, 0, max_index);
  for (i = 0; prime_cache[i] <= bound && i < max_index; ++i)
    if (x % prime_cache[i] == 0) return 0;
  return 1;
}

/************************************************/
/* This function will create MAX prime numebers */
/* starting from 2 and store it in the array    */
/* PRIME_CACHE				        */
/************************************************/
void fill_prime_cache ()
{
  int i;
  max_index = 0;
  prime_cache[max_index++] = 2;
  for (i = 3; i <= MAX; i+=2)
    if (is_prime (i))
      prime_cache[max_index++] = i;
}

int main ()
{
  int total_case;
  int m, n;
  int result;
  int i;

  fill_prime_cache ();
#ifdef DEBUG
  for (i = 0; i < max_index; ++i)
    printf ("%d\n", prime_cache[i]);
  printf ("%d\n", binary_search (99923, 0, max_index));
#endif

  result = scanf ("%d", &total_case);
  while ((result = scanf ("%d %d", &m, &n)) != EOF) {
    if (result == 0) break;
    if (m <= 2 && n >= 2) {
      printf ("2\n");
      m = 3;
    }
    if (m > 2 && m % 2 == 0) ++m;
    for (i = m; i <= n; i+=2) {
      if (is_prime_cache (i))
  	printf ("%d\n", i);
    }
    printf ("\n");
  }
  return 0;
}
