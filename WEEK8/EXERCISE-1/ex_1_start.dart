import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

List<Widget> getColorLabels() {
  return colors.map((color) => Label(color)).toList();
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const Label("Method 1: Loop in Array", bold: true),
              for (final color in colors) Label(color),
              const Label("Method 2: Map", bold: true),
              ...colors.map((color) => Label(color)),
              const Label("Method 3: Dedicated Function", bold: true),
              // A function returns a list, so spread it into children.
              ...getColorLabels(),
            ],
          ),
        ),
      ),
    ),
  );
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
