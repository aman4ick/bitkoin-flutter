


import '../features/crypto_coin/view/crypto_coin_screen.dart';
import '../repositories/models/crypto_coin.dart';
import '../features/crypto_list/crypto_list.dart';

final routes = {
  '/' : (context) => const CryptoListScreen(),
  '/coin' : (context) => const CryptoCoinScreen(),
};