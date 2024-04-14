import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/blocs/login/login_cubit.dart';
import 'package:test1/blocs/login/login_state.dart';
import 'package:test1/screens/home_screen.dart';
import 'package:test1/widgets/buttons.dart';
import 'package:test1/widgets/progress_indicator.dart';
import 'package:test1/widgets/text.dart';
import 'package:test1/widgets/text_form_field.dart';
import '../utils/constants.dart';
import '../utils/custom_painters.dart';
import '../widgets/alert.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = false;
  bool _intio = false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkData();
  }
  Future<void> checkData()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if(prefs.containsKey("userList")){

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
  else{
    setState(() {
      _intio =true;
    });


  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
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
          else if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        },
        builder: (context, state) {
          return _intio?Stack(
            children: [
              CustomPaint(
                painter: BodyPainter(),
                size: Size.infinite,
              ),
              Positioned(
                right: AppConstants.right,
                left: AppConstants.left,
                top: AppConstants.top,
                child: SizedBox(
                  width: AppConstants.width,
                  height: AppConstants.height,
                  child: Image.asset(AppConstants.logoPath),
                ),
              ),
              if (state is LoginLoading)
                Positioned(
                  right: AppConstants.indicatorRight,
                  left: AppConstants.indicatorLeft,
                  bottom: AppConstants.indicatorBottom,
                  child: CircularProgressIndicator(
                    color: AppConstants.secondaryColor,
                  ),
                ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.inputFieldPadding),
                  height: MediaQuery.of(context).size.height *
                      AppConstants.containerHeight,
                  width: MediaQuery.of(context).size.width *
                      AppConstants.containerWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        AppConstants.containerBorderRadius),
                    color: AppConstants.myWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        showTextTilte(
                            AppConstants.loginTitle,
                            AppConstants.pageTitleFontSize,
                            AppConstants.secondaryColor,
                            FontWeight.bold,
                            AppConstants.fontFamily),
                        const SizedBox(height: AppConstants.titleLoginSpacing),
                        showTextFormField(
                            _emailController,
                            AppConstants.textFormFieldEmailLabel,
                            AppConstants.textFormFieldEmailHint,
                            AppConstants.textFormFieldLabelFontSize,
                            AppConstants.secondaryColor,
                            AppConstants.fontFamily,
                            AppConstants.textFormFieldHintFontSize,
                            AppConstants.myGrey,
                            AppConstants.fontFamily,
                            Icons.email,
                            AppConstants.secondaryColor,
                            AppConstants.textFormFieldBorderRadius,
                            AppConstants.textFormFieldBorderRadius,
                            AppConstants.secondaryColor,
                            AppConstants.textFormFieldBorderRadius,
                            AppConstants.secondaryColor
                            ),
                        const SizedBox(height: AppConstants.inputFieldSpacing),
                        showTextFormFieldPassword(
                          _passwordController,
                          !_obscurePassword,
                          AppConstants.textFormFieldPasswordLabel,
                          AppConstants.textFormFieldPasswordHint,
                          AppConstants.textFormFieldLabelFontSize,
                          AppConstants.secondaryColor,
                          AppConstants.fontFamily,
                          AppConstants.textFormFieldHintFontSize,
                          AppConstants.myGrey,
                          AppConstants.fontFamily,
                          Icons.password,
                          AppConstants.secondaryColor,
                          AppConstants.textFormFieldBorderRadius,
                          AppConstants.textFormFieldBorderRadius,
                          AppConstants.secondaryColor,
                          AppConstants.textFormFieldBorderRadius,
                          AppConstants.secondaryColor,
                          Icons.visibility,
                          Icons.visibility_off,
                          AppConstants.primaryColor,
                          AppConstants.secondaryColor,

                          onPressed: () => setState(() {
                            _obscurePassword = !_obscurePassword;
                          }),
                        ),
                        const SizedBox(height: AppConstants.inputFieldSpacing),
                        showButton(
                            AppConstants.secondaryColor,
                            AppConstants.loginButtonRadius,
                            AppConstants.loginButtonText,
                            AppConstants.loginButtonFontSize,
                            AppConstants.myWhite,
                            AppConstants.fontFamily, onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).login(
                              _emailController.text,
                              _passwordController.text,
                            );


                          }
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ):showProgressIndicator(AppConstants.secondaryColor);
        },
      ),
    );
  }
}
