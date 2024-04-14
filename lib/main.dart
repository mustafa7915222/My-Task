import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/blocs/login/login_cubit.dart';
import 'package:test1/blocs/splash/splash_cubit.dart';
import 'package:test1/blocs/task_list/task_list_cubit.dart';
import 'package:test1/repositories/login_repository.dart';
import 'package:test1/repositories/splash_repository.dart';
import 'package:test1/repositories/task_list_repository.dart';
import 'package:test1/screens/splash_screen.dart';
import 'package:test1/services/login_api_service.dart';
import 'package:test1/services/splash_api_service.dart';
import 'package:test1/services/task_list_api_service.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splashApiService = SplashApiService(); // إنشاء مثيل من loginApiService
    final splashRepository = SplashRepository(splashApiService);
    final loginApiService = LoginApiService(); // إنشاء مثيل من loginApiService
    final loginRepository = LoginRepository(loginApiService);
    final taskListApiService = TaskListApiService(); // إنشاء مثيل من loginApiService
    final taskListRepository = TaskListRepository(taskListApiService);// إنشاء مثيل من LoginRepository مع تمرير loginApiService
// إنشاء مثيل من LoginRepository مع تمرير loginApiService
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (context) => SplashCubit(splashRepository),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(loginRepository),
        ),
        BlocProvider<TaskListCubit>(
          create: (context) => TaskListCubit(taskListRepository),
        ),

        // يمكنك إضافة المزيد من MultiBlocProviders هنا إذا كان لديك المزيد من الـ Cubits
      ],
      child: MaterialApp(
        title: 'My App',
        home: SplashScreen(),
      ),
    );
  }
}
