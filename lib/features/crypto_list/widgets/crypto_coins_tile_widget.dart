import 'package:cryptocoins_app/repositories/model/crypto_coin.dart';
import 'package:flutter/material.dart';
class Crypto_Coins_Tile extends StatelessWidget {
  const Crypto_Coins_Tile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;


  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.network(
          coin.imageUrl,
          height: 25,
        ),
        title: Text(coin.name, style: Theme.of(context).textTheme.bodyMedium),
        subtitle: Text(
          "${coin.priceInUSD}\$",
          style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.of(context).pushNamed('/coin', arguments: coin.name);
        },
      );
  }
}