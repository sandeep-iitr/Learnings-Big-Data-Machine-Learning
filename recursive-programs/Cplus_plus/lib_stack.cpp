/*
Pushing elements into stack.
Poping element out of stack.
stack.top: gives the top element of the stack
*/

#include <iostream>       
#include <stack>          

using namespace std;

int main ()
{
  stack<int> mystack;

  for (int i=0; i<5; ++i) 
  mystack.push(i);

  std::cout << "Popping out elements...";
  
  while (!mystack.empty())
  {
     std::cout << ' ' << mystack.top();
     mystack.pop();
  }
  std::cout << '\n';

  return 0;
}
