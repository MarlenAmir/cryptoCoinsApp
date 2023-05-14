import 'dart:async';

import 'package:cryptocoins_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:cryptocoins_app/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:cryptocoins_app/repositories/model/crypto_coin.dart';
import 'package:cryptocoins_app/theme/theme.dart';
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
        body: RefreshIndicator(
          onRefresh: () async {
            _cryptoListBloc.add(LoadCryptoList());
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
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
              if (state is CryptoListLoadingFailure) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Something went wrong",
                        style: darkTheme.textTheme.headlineMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Please try again later",
                        style: darkTheme.textTheme.labelSmall?.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          _cryptoListBloc.add(LoadCryptoList());
                        },
                        child: Text(
                          "Try again",
                        ))
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
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
