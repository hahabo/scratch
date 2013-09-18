#include <cstdio>
using namespace std;

int main(int argc, char *argv[])
{
  unsigned n, k;
  scanf("%d %d", &n, &k);

  unsigned count = 0;

  unsigned t;
  
  while (scanf("%d", &t) != EOF)
    if (t % k == 0) count++;

  printf("%d\n", count);

  return 0;
}
