import 'package:cryptocoins_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:cryptocoins_app/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:cryptocoins_app/repositories/model/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cryptocoins_app/features/crypto_list/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<CyrptoCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("CryptoCurrenciesList")),
        ),
        body: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                  padding: EdgeInsets.only(top: 16),
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return Crypto_Coins_Tile(coin: coin);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.coinsList.length);
            }
            if(state is CryptoListLoadingFailure){
              return Center(child: Text("Something went wrong"),);
            }
            return const Center(child: CircularProgressIndicator());
          },
        )

        /*(_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                return Crypto_Coins_Tile(coin: coin);
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _cryptoCoinsList!.length),*/

        );
  }
}
