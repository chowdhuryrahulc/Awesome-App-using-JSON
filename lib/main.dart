import 'package:flutter/material.dart';
import 'package:awesome2/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coctail App',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          // accentColor: Colors.lightBlue,
          buttonTheme: ButtonThemeData(buttonColor: Colors.green)),
      home: Homepage(),
    );
  }
}
