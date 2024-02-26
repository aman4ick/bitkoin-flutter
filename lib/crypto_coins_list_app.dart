

import 'package:cryptoproject/router/router.dart';
import 'package:cryptoproject/theme/theme.dart';
import 'package:flutter/material.dart';


class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciesListApp',
      theme: darkTheme,
      routes: routes,
    );
  }
}