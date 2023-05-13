import 'package:flutter/material.dart';
import 'package:cryptocoins_app/features/crypto_list/widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    const coinName = 'BNB';
    return Scaffold(
      appBar: AppBar(
        title: const Text("CryptoCurrenciesList"),
      ),
      body: const Crypto_Coins_Tile(coinName: coinName),
    );
  }
}




