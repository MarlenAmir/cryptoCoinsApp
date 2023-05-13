import 'package:flutter/material.dart';
import 'package:cryptocoins_app/router/router.dart';
import 'package:cryptocoins_app/theme/theme.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CryptoCurrenciesList",
      theme: darkTheme,
      routes: routes,
    );
  }
}