


import 'package:cryptoproject/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:cryptoproject/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:cryptoproject/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';



class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}


class _CryptoListScreenState extends State<CryptoListScreen> {



  final _cryptoListBloc = CryptoListBloc(
      GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CryptoCurrenciesList'),
        leading: Icon(Icons.arrow_back),
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if(State is CryptoListLoaded) {

            return ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemCount: state.coinsList.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, i) {
                final coin = state.coinsList[i];
                return  cryptoCoinTile(coin: coin);

              },
            );
          }
          if(state is CryptoListLoadingFailure) {
            final theme = Theme.of(context); // Получаем текущую тему из контекста

            return  Center(
              child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong',
                    style: theme.textTheme.headline6, // Используем тему для стилизации текста
                  ),
                  Text(
                    'Please try again later',
                    style: theme.textTheme.subtitle1?.copyWith(fontSize: 16), // Используем тему для стилизации текста
                  ),
                  SizedBox(height: 30),
                  TextButton(onPressed: () {
                    _cryptoListBloc.add(LoadCryptoList());
                  }, child: Text('Try again')),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator(),);
        },
      ),



    );

  }

}
