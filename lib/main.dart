import 'package:flutter/material.dart';

import '../Widget/User_Task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              headline3: TextStyle(fontWeight: FontWeight.bold),
            ),
        appBarTheme: ThemeData.light()
            .appBarTheme
            .copyWith(backgroundColor: Colors.black),
      ),
      title: "Todolist",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return UserTask();
  }
}
