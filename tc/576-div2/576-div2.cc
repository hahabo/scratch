#include <vector>
using namespace std;

class TheExperimentDiv2 {
public:
  vector<int> determineHumidity(vector<int> intensity, int L, vector<int> leftEnd)
  {
    vector<int> result;
    for (vector<int>::size_type i = 0;
	 i != leftEnd.size();
	 ++i) {
      int tot_intensity = 0;
      for (int j = leftEnd[i];
	   j != leftEnd[i] + L;
	   ++j) {
	tot_intensity += intensity[j];
	intensity[j] = 0;
      }
      result.push_back (tot_intensity);
    }
    return result;
  }
};
