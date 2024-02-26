import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {

  String? coinName;

  @override
  void didChangeDependencies() {
   // final args = ModalRoute.of(context)?.settings.arguments;
  //  assert(args != null && args is String, 'You must provide String args');
    coinName = 'CoinList';
    setState(() {});
    super.didChangeDependencies();
  }


  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...')),
    );

  }
}
