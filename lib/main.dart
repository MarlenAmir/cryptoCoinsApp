import 'package:cryptocoins_app/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cryptocoins_app/crypto_currencies_list_app.dart';
import 'package:get_it/get_it.dart';


void main() {
  GetIt.I.registerSingleton(CyrptoCoinsRepository(dio: Dio()));
  runApp(const CryptoCurrenciesListApp());
}


 

