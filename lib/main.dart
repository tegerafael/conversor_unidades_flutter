import 'package:conversor_unidades_flutter/category_screen.dart';
import 'package:flutter/material.dart';
import 'converter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/converter': (context) => Conversor(),
      },
    );
  }
}