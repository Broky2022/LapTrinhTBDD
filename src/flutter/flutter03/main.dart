import 'package:flutter/material.dart';
import 'Exam.dart';
import 'bt1.dart';
import 'bt2.dart';
import 'bt3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam',
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

