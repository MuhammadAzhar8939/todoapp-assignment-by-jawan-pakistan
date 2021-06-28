import 'package:flutter/material.dart';

import 'TodoApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "TodoApp",
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
          ),
        ),
        body: TodoApp(),
      ),
    );
  }
}
