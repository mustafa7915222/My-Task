import 'package:flutter/material.dart';

import '../utils/constants.dart';

Widget showButton(
backgroundColor,
    buttonRadius,
    buttonText,
    buttonTextFontSize,
    buttonTextColor,
    buttonTextFontFamily,
{required void Function() onPressed}

)
{
  return ElevatedButton(
    onPressed:onPressed,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
              (states) => backgroundColor),
      shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                buttonRadius),
          )),
    ),
    child:  Text(
      buttonText,
      style: TextStyle(
        fontSize: buttonTextFontSize,
        color: buttonTextColor,
        fontFamily: buttonTextFontFamily,
      ),
    ),
  );
}