import 'package:flutter/material.dart';

import 'ui/screens/welcome_screen.dart';
import 'ui/screens/temperature_screen.dart';
 
class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool _isWelcomeScreen = true;

  void _switchScreen() {
    setState(() {
      _isWelcomeScreen = false;
    });
  }

  @override
  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _isWelcomeScreen
              ? WelcomeScreen(onStart: _switchScreen)
              : TemperatureScreen(),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}