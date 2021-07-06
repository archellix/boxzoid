#include<stdio.h>
#include<assert.h>
#include<telring.h>

int main() {
  ring_t result = ring();
  assert(result == 1);
}