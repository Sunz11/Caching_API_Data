import 'package:caching_api/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'src/screens/home.dart';

void main() => runApp(
  MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: themes,
)
);