import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:test1/blocs/splash/splash_cubit.dart';
import 'package:test1/blocs/splash/splash_state.dart';
import 'package:test1/screens/login_page.dart';
import 'package:test1/utils/constants.dart';

import '../widgets/alert.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Duration animationDuration;
  @override
  void initState() {
    super.initState();
    // Simulate a time-consuming task (e.g., loading data) for the splash screen.
    // Replace this with your actual data loading logic.
    Future.delayed(
      Duration(seconds: 2),
          () {
            BlocProvider.of<SplashCubit>(context).checkData();

          },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppConstants.backgroundColorLight,
      body:BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is FetchDataFailure) {
            showDialog(
              context: context,
              builder: (_) => showAlertDialog(
                  state.error,
                  context,
                  AppConstants.loginFailedMessage,
                  AppConstants.loginFailedMessage,
                  AppConstants.dialogButtonText),
            );
          }
          else if (state is DataFound) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
          else if (state is DataNotFound) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  width: AppConstants.width,
                  height: AppConstants.height,
                  child: Image.asset(AppConstants.logoPath),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: JumpingDots(
                    color: AppConstants.primaryColor,
                    radius: 10,
                    numberOfDots: 4,
                    animationDuration: animationDuration = Duration(milliseconds: 300),
                  ),
                ),
              ],
            ),
          );
        },
      ),






    );
  }
}