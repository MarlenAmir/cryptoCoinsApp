import 'package:cryptocoins_app/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:cryptocoins_app/repositories/model/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cryptocoins_app/features/crypto_list/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("CryptoCurrenciesList")),
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                return Crypto_Coins_Tile(coin: coin);
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _cryptoCoinsList!.length),
  
    );
  }

  Future<void> _loadCryptoCoins() async {
      _cryptoCoinsList = await GetIt.I<CyrptoCoinsRepository>().getCoinsList();
      setState(() {
        
      });
  }
}
