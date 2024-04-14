import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test1/blocs/login/login_cubit.dart';
import 'package:test1/blocs/login/login_state.dart';
import 'package:test1/repositories/login_repository.dart';
import 'package:test1/services/login_api_service.dart';
import 'package:test1/models/user.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  group('LoginCubit', () {
    late LoginCubit loginCubit;
    late MockLoginRepository mockLoginRepository;

    setUp(() {
      mockLoginRepository = MockLoginRepository();
      loginCubit = LoginCubit(mockLoginRepository);
    });

    test('initial state is LoginInitial', () {
      expect(loginCubit.state, LoginInitial());
    });

    test('login success emits LoginSuccess', () async {
      // Arrange
      final user = User(
        id: 1,
        username: 'testuser',
        email: 'test@example.com',
        firstName: 'Test',
        lastName: 'User',
        gender: 'male',
        image: '',
        token: 'token',
      );
      when(mockLoginRepository.login( 'email',  'password'))
          .thenAnswer((_) async => user);

      // Act
      loginCubit.login('test@example.com', 'password');

      // Assert
      await untilCalled(mockLoginRepository.login('email',  'password'));
      verify(mockLoginRepository.login('test@example.com', 'password')).called(1);
      expect(loginCubit.state, LoginSuccess(user: user));
    });

    test('login failure emits LoginFailure', () async {
      // Arrange
      final errorMessage = 'Invalid credentials';
      when(mockLoginRepository.login( 'email',  'password'))
          .thenThrow(Exception(errorMessage));

      // Act
      loginCubit.login('invalid@example.com', 'password');

      // Assert
      await untilCalled(mockLoginRepository.login('email',  'password'));
      verify(mockLoginRepository.login('invalid@example.com', 'password')).called(1);
      expect(loginCubit.state, isA<LoginFailure>());
    });
  });
}
