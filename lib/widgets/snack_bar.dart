import 'package:flutter/material.dart';


SnackBar showSnakBar(text ,error){
  return  SnackBar(
    content: Text('$text $error'),
  );
}