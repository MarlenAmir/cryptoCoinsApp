import 'package:cryptocoins_app/features/crypto_list/crypto_list.dart';
import 'package:cryptocoins_app/features/crypto_coin/crypto_coin.dart';

final routes = {
  '/': (context) => const CryptoListScreen(),
  '/coin': (context) => const CryptoCoinScreen()
};
