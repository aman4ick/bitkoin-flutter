



import 'package:cryptoproject/repositories/crypto_coins/crypto_coins.dart';
import 'package:cryptoproject/repositories/models/crypto_coin.dart';

import 'package:dio/dio.dart';




class CryptoCoinsRepository implements AbstractCoinsRepository {

  CryptoCoinsRepository({required this.dio});
  final Dio dio;


  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AID,SOL&tsyms=USD'
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries
        .map((e) {

      final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;;

      final price = usdData['PRICE'];
      final imageURL = usdData['IMAGEURL'];
      return CryptoCoin(
            name: e.key,
            priceInUSD: price,
            imageUrl: 'https://www.cryptocompare.com/$imageURL',
        );})
        .toList();

    return cryptoCoinsList; // Вернуть список криптовалют
  }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) {
    // TODO: implement getCoinDetails
    throw UnimplementedError();
  }
}
