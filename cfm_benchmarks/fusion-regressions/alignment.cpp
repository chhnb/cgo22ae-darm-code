#include <algorithm>
#include <iostream>
#include "SmithWaterman.h"
struct Score : ScoringFunction<int*> {
  int operator()(int* a,int* b) override {return *a==*b?10:0;}
  int gap(int) override {return 2;}
};
int main(){
  int alphabet[]={1,2,3};std::vector<std::vector<int*>> seqs(1);
  for(int len=1;len<=4;len++){
    auto old=seqs;
    for(auto s:old) if(s.size()==size_t(len-1))
      for(auto&x:alphabet){auto q=s;q.push_back(&x);seqs.push_back(q);}
  }
  Score score;int checked=0;
  for(auto a:seqs)for(auto b:seqs){
    SmithWaterman<int*,std::vector<int*>,nullptr> sw(score);
    auto aligned=sw.compute(a,b);std::vector<int*> left,right;
    for(auto e:aligned){if(e.getLeft())left.push_back(e.getLeft());if(e.getRight())right.push_back(e.getRight());if(e.match()&&*e.getLeft()!=*e.getRight())return 2;}
    if(a!=left||b!=right){std::cerr<<"alignment lost/reordered an instruction\n";return 1;}
    ++checked;
  }
  std::cout<<"PASS "<<checked<<" ordered sequence pairs, including empty and unequal suffixes\n";
}
