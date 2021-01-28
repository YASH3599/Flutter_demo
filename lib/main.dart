import 'package:flutter/material.dart';
import 'package:flutter_form/StartPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter State management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: StartPage(title: 'Flutter Demo Home Page')),
      );
  }
}