import '../../models/user.dart';

abstract class SplashState {}

class FetchDataInitial extends SplashState {}

class DataFound extends SplashState {}

class DataNotFound extends SplashState {
}

class FetchDataFailure extends SplashState {
  final String error;

  FetchDataFailure({required this.error});
}
