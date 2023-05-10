import 'package:flutter/material.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CryptoCurrenciesList",
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 16, 15, 15),
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 16, 15, 15)),
        dividerColor: Colors.white24,
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      ),
                      
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CryptoCurrenciesList"),
      ),
      body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) => ListTile(
            leading: Image.asset('assets/svg/Bitcoin.svg.png', height: 25,),
                title: Text(
                  'Bitcoin',
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                subtitle: Text("20000\$", style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w700),),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ),
    );
  }
}
