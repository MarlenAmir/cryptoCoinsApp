import 'dart:async';

import 'package:cryptocoins_app/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:cryptocoins_app/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        emit(CryptoListLoading());
        final coinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadingFailure(e));
      }
    });
  }
  final AbstractCoinsRepository coinsRepository;
}
