#include <iostream>
using namespace std;

long algo (long n)
{
  long count = 1;
#ifdef NONO
  cout << n << " ";
#endif
  while (n != 1) {
    if (n % 2)
      n = 3*n + 1;
    else
      n = n/2;
#ifdef NONO
    cout << n << " ";
#endif
    ++count;
  }
#ifdef NONO
  cout << endl;
#endif
  return count;
}

int main ()
{
  long i, j, x, y, y_max, lower, upper;
  while (cin >> i >> j) {
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
    cout << i << " " << j << " " << y_max << endl;
  }
  return 0;
}
