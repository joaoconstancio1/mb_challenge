import 'package:flutter/material.dart';
import 'package:mb_challenge/core/injection.dart';
import 'package:mb_challenge/modules/exchanges/presenter/pages/exchanges_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Exchanges',
      home: const ExchangesListPage(),
    );
  }
}
