import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello my name is Henry !',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.orange, fontSize: 50),
          ),
        ),
      ),
    ),
  );
}
