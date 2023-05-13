import 'package:flutter/material.dart';
class Crypto_Coins_Tile extends StatelessWidget {
  const Crypto_Coins_Tile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, i) => ListTile(
        leading: Image.asset(
          'assets/svg/Bitcoin.svg.png',
          height: 25,
        ),
        title: Text(coinName, style: Theme.of(context).textTheme.bodyMedium),
        subtitle: Text(
          "20000\$",
          style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.of(context).pushNamed('/coin', arguments: coinName);
        },
      ),
    );
  }
}