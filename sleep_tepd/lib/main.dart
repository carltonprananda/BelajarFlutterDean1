import 'package:flutter/material.dart';
import 'package:sleep_tepd/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePart()
    );
  }
}