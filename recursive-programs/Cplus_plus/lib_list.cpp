/*
Declares a list, insert elements and shows the use of iterator
*/

#include <iostream>
#include <list>

using namespace std;

int main ()
{
  list<int> first;
  
  int a[]={1,2,3,4,5};
  
  for(int i=0;i<(sizeof(a)/sizeof(*a));i++)
  {
      first.push_back(a[i]);
  }
  
  cout << "Size of List is: " << int (first.size()) << '\n';
 
 cout<<"Content of List is:"<<endl;
 
  list<int>::iterator it;
  for (it = first.begin(); it != first.end(); it++)
    std::cout << ' ' << *it;
 
  return 0;
}
