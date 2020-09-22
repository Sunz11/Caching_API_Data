import 'package:flutter/material.dart';

Widget appBarGradient(){
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>
          [
            Colors.black,
            Colors.teal[600],

          ]),
    ),
  );

}