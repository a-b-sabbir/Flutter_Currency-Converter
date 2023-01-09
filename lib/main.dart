import 'package:flutter/material.dart';
import 'package:currency_converter/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Currency Converter App',
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}
