import 'package:flutter/material.dart';
import 'package:tenis_web/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fernando III Tenis Web',
      home: HomeScreen(),
    );
  }
}