#include <iostream>
#include <string>

int main(int argc, char *argv[]) {
  if (argc != 2) {
    std::cerr << "Invalid number of args" << std::endl;
    return 1;
  }

  float n = std::stof(argv[1]);
  printf("%.2f", 100.00 - n);
  return 0;
}
