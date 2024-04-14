import 'package:flutter/material.dart';

import '../utils/constants.dart';

Widget showTextTilte(
    text,
    fontSize,
    color,
    fontWeight,
    fontFamily
    )
{
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    ),
  );
}