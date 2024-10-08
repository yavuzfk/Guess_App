import 'dart:math';

class NumberGuessUsecase {
  static int generateRandomNumber() {
    Random random = Random();
    return random.nextInt(100) + 1; // 1-10 arası rastgele sayı üretir
  }
}
