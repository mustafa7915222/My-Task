import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/utils/constants.dart';
import '../../models/user.dart';
import '../../repositories/login_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;

  LoginCubit(this._loginRepository) : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    try {
      final user = await _loginRepository.login(email, password);

      emit(LoginSuccess(user: user));
    } catch (e) {
      print(e);
      emit(LoginFailure(error: e.toString()));
    }
  }

  void loginInt() async {

    emit(LoginInitial());
  }
}
