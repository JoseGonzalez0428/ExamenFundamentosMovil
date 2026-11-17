//import 'package:fit_track_pro/features/auth/screens/auth_check_screen.dart';
import 'package:fit_track_pro/features/weight/screens/weight_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitTrackPro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)),
      home: const WeightScreen(),
    ); // MaterialApp
  }
}
