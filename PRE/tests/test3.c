#include <stdio.h>

int main() {
  int a = 1;
  int b = 2;
  int t1;
  if (a) {
    a = 3;
    t1 = a + b;
  } else {
    int c = 1;
  }
  int t3 = a + b;
  return t3;
}