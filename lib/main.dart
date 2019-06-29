import 'package:flutter/material.dart';

// Import the homescreen from the screens package
import 'package:flutter_template/screens.dart' show MyHomePage;

void main() => runApp(new MyApp());

// Main application, specifies the application to display when first opening the app.
class MyApp extends StatelessWidget {
  static final String title = 'Dalian 2019 Template';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: title),
    );
  }
}

