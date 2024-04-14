import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/repositories/splash_repository.dart';
import 'package:test1/utils/constants.dart';
import '../../models/user.dart';
import '../../repositories/login_repository.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashRepository _splashRepository;

  SplashCubit(this._splashRepository) : super(FetchDataInitial());

  void checkData() async {
    print(123456);

    try {
      final dataState = await _splashRepository.checkData();
if(dataState){
  emit(DataFound());

}
else{
  emit(DataNotFound());

}
    } catch (e) {
      print(e);
      emit(FetchDataFailure(error: e.toString()));
    }
  }

  void fetchDataInt() async {

    emit(FetchDataInitial());
  }
}
