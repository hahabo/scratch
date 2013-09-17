#include <iostream>
using namespace std;

int main(int argc, char *argv[])
{
  int x;

  while (cin >> x && x != 42)
    cout << x << endl;

  return 0;
}
