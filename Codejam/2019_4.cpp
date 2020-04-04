#include <bits/stdc++.h>
using namespace std;
int main()
{
  int t,b;
  cin>>t>>b;
  for(int _=1;_<=t;_++)
  {
  	int answer[b+1];
  	for(int i=1;i<=b;i++)
  	{
  		cout<<i<<endl;
  		cin>>answer[i];
  	}
  	for(int i=1;i<=b;i++)
  		cout<<(char)(answer[i]+'0');
  	cout<<endl;
  	char verdict;
  	cin>>verdict;
  	if(verdict!='Y') exit(0);
  }
 	return 0;
}
