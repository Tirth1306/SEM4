#include <bits/stdc++.h>

#define TESTCASE int t;cin>>t;while(t--)

int main() {
  TESTCASE{
    int n;
    std::cin>>n;
    std::vector<std::vector<int>> v;
    std::vector<std::vector<int>> vT;

    int trace = 0;
    int rw = 0;
    int cl = 0;

    for(int i = 0 ; i<n;i++){
      for(int j = 0 ; j<n;j++){
        int x;
        std::cin >> x;
        v[i].push_back(x);
        v[j].push_back(x);
      }
    }

    

  }
  return 0;
}
