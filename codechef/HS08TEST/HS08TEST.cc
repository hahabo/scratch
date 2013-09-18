#include <iostream>
#include <cstdlib>
using namespace std;

int main(int argc, char *argv[])
{
  int x;
  double y;

  cin >> x >> y;

  // cout << x << " " << y
  //      << endl;

  double bank_charge = 0.5;

  cout.precision(2);

  if (x % 5) {
    cout << fixed << y << endl;
    exit(0);
  }

  if (x + bank_charge <= y)
    cout << fixed << y - (x + bank_charge) << endl;
  else
    cout << fixed << y << endl;

  return 0;
}
