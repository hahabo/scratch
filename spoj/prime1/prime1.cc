#include <iostream>
#include <cmath>
#include <map>
using namespace std;

#define MAX_PRIME 100000
map<int,int> prime_hash;

void create_prime_hash ()
{
  prime_hash[2] = 1;
  for (int i = 3; i <= MAX_PRIME; i+=2) {
    bool prime = true;
    map<int,int>::iterator it;
    for (it = prime_hash.begin(); it != prime_hash.end()
	   && it->first <= sqrt (i); ++it) {
      if (i % it->first == 0)
	prime = false;
    }
    if (prime)
      prime_hash[i] = 1;
  }
}

void print_prime_hash ()
{
  map<int,int>::iterator it;
  for (it = prime_hash.begin(); it != prime_hash.end();
       ++it)
    cout << it->first << " => " << it->second << endl;
}

int is_prime (int x)
{
  int bound = sqrt (x);

  if (x < 2)
    return 0;
  if (x == 2)
    return 1;
  if (x % 2 == 0)
    return 0;

  map<int,int>::iterator it;
  for (it = prime_hash.begin(); it != prime_hash.end()
	 && it->first <= bound; ++it) {
    if (x % it->first == 0)
      return 0;
  }
  
  return 1;
}

int main ()
{
  int total_case;
  int m, n;
  int i;

  create_prime_hash ();
  //print_prime_hash ();

  cin >> total_case;
  while (cin >> m >> n) {
    for (i = m; i <= n; ++i) {
      if (is_prime (i)) {
	cout << i << endl;
      }
    }
    cout << endl;
  }
  return 0;
}
