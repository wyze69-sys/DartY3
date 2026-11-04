import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 100),
            Container(height: 400, color: const Color(0xFF4472C4)),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(child: Container(color: const Color(0xFF70AD47))),
                  Container(width: 100, color: const Color(0xFFE674BF)),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.amber)),
                  const SizedBox(width: 20),
                  Expanded(child: Container(color: Colors.amber)),
                  const SizedBox(width: 20),
                  Expanded(child: Container(color: Colors.amber)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: Container(color: const Color(0xFFE674BF))),
          ],
        ),
      ),
    ),
  );
}
