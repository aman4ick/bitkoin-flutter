

part of 'crypto_list_bloc.dart';


class CryptoListState{
  get coinsList => null;
}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoading extends CryptoListState {}

class CryptoListLoaded extends CryptoListState {

  CryptoListLoaded({
    required this.coinsList,
});
  final List<CryptoCoin> coinsList;
}

class CryptoListLoadingFailure extends CryptoListState {
  CryptoListLoadingFailure({this.exception});

  final Object? exception;


}