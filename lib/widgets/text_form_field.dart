import 'package:flutter/material.dart';

import '../utils/constants.dart';

Widget showTextFormField(
    controller,
    labelText,
    hintText,
    labelFontSize,
    labelColor,
    labelFontFamily,
    hintFontSize,
    hintColor,
    hintFontFamily,
    prefixIcon,
    prefixIconColor,
    borderRadius,
    focusedBorderRadius,
    focusedBorderSideColor,
    errorBorderRadius,
    errorBorderSideColor,
    )

{
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      labelStyle:  TextStyle(
        fontSize: labelFontSize,
        color: labelColor,
        fontFamily: labelFontFamily,
      ),
      hintStyle:  TextStyle(
        fontSize: hintFontSize,
        color: hintColor,
        fontFamily: hintFontFamily,
      ),
      prefixIcon:  Icon(prefixIcon, color: prefixIconColor),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(focusedBorderRadius),
        borderSide:  BorderSide(color: focusedBorderSideColor, width: 2),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(errorBorderRadius),
        borderSide:  BorderSide(color: errorBorderSideColor, width: 2),
      ),
    ),
  );

}

Widget showTextFormFieldPassword(
    controller,
    obscureText,
    labelText,
    hintText,
    labelFontSize,
    labelColor,
    labelFontFamily,
    hintFontSize,
    hintColor,
    hintFontFamily,
    prefixIcon,
    prefixIconColor,
    borderRadius,
    focusedBorderRadius,
    focusedBorderSideColor,
    errorBorderRadius,
    errorBorderSideColor,
    suffixIcon1,
    suffixIcon2,
    suffixIconColor1,
    suffixIconColor2,
    {required void Function() onPressed}
    )

{
  return TextFormField(
    controller: controller,
    obscureText:obscureText,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      labelStyle:  TextStyle(
        fontSize: labelFontSize,
        color: labelColor,
        fontFamily: labelFontFamily,
      ),
      hintStyle:  TextStyle(
        fontSize: hintFontSize,
        color: hintColor,
        fontFamily: hintFontFamily,
      ),
      prefixIcon:  Icon(prefixIcon, color: prefixIconColor),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(focusedBorderRadius),
        borderSide:  BorderSide(color: focusedBorderSideColor, width: 2),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(errorBorderRadius),
        borderSide:  BorderSide(color: errorBorderSideColor, width: 2),
      ),
      suffixIcon: IconButton(
        onPressed: onPressed,
        icon: Icon(
          !obscureText
              ? suffixIcon1
              : suffixIcon2,
          color: !obscureText
              ? suffixIconColor1
              : suffixIconColor2,
        ),
      ),
    ),
  );

}
