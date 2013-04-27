#include <iostream>
#include <vector>
#include "576-div2.cc"

using namespace std;

void printv (vector<int> &v)
{
  for (vector<int>::const_iterator it = v.begin();
       it != v.end();
       ++it)
    cout << *it << " ";
  cout << endl;
}

int main ()
{
  TheExperimentDiv2 obj;

  int _intensity[] = {2, 6, 15, 10, 8, 11, 99, 2, 4, 4, 4, 13};
  vector<int> intensity(_intensity, _intensity+12);
  printv (intensity);

  int L = 4;

  int _leftEnd[] = {1, 7, 4, 5, 8, 0};
  vector<int> leftEnd(_leftEnd, _leftEnd+6);
  printv (leftEnd);

  vector<int> result = obj.determineHumidity(intensity, L, leftEnd);
  printv (result);
  
  return 0;
}
