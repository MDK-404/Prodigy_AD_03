
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch_app_provider/screens/home_screen.dart';
import 'package:stopwatch_app_provider/provider/timer_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<TimerProvider>(
        create: (context) => TimerProvider(),
        child: HomeScreen(),
      ),
    );
  }
}