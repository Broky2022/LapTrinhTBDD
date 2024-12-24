import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'bai01/ex01.dart';
//import 'bai02/ex02.dart';
import 'bai03/ex03.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => CountProvider(),
      child: const MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CountScreen(),
    );
  }
}