import 'package:flutter/material.dart';

PreferredSizeWidget showAppBarWithOneActionIcon(
    title,
    titleFontSize,
    titleColor,
    titleFontFamily,
    backgroundColor,
    icon1,
    iconColor1,
    {required void Function() onPressed1,}
    )
{
  return  AppBar(
    title:  Text(title, style: TextStyle(
      fontSize: titleFontSize,
      color: titleColor,
      fontFamily: titleFontFamily,
    )),
    backgroundColor: backgroundColor,
    actions: [
      IconButton(
        onPressed: onPressed1,
        icon: Icon(icon1, color: iconColor1),
      ),

    ],
  );
}


PreferredSizeWidget showAppBarWithOneActionIconAndOneLeadingIcon(
    title,
    titleFontSize,
    titleColor,
    titleFontFamily,
    backgroundColor,
    actionIcon,
    actionIconColor,
    {required void Function() onPressed,


    }
    )
{
  return  AppBar(
    title:  Text(title, style: TextStyle(
      fontSize: titleFontSize,
      color: titleColor,
      fontFamily: titleFontFamily,
    )),
    backgroundColor: backgroundColor,

    actions: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(actionIcon, color: actionIconColor),
      ),
    ],
  );
}
PreferredSizeWidget showAppBarDefault(
    title,
    titleFontSize,
    titleColor,
    titleFontFamily,
    backgroundColor,
    )
{
  return  AppBar(
    title:  Text(title, style: TextStyle(
      fontSize: titleFontSize,
      color: titleColor,
      fontFamily: titleFontFamily,
    )),
    backgroundColor: backgroundColor,
  );
}
