void main() {
  int count = 0;
  while (count < 4) {
    print("Count = $count");
    count = count + 1;
  }

  // Do .. While
  count = 0;
  do {
    print("Do While Count = $count");
    count += 1;
    if (count == 3) {
      break;
    }
  } while (count < 5);
}
