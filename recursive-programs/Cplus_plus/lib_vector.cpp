/*
vector: push_back, and [] operator
*/
#include <iostream>
#include <vector>

using namespace std;

int main ()
{
  vector<int> myvector;
  int myint;

  std::cout << "Please enter some integers (enter 0 to end):\n";

  do {
    cin >> myint;
    myvector.push_back (myint);
  } while (myint);

  std::cout << "myvector stores " << int(myvector.size()) << " numbers.\n";
 
  for(int i=0;i<myvector.size();i++)
  cout<<myvector[i]<<' ';

  return 0;
}
