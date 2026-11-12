import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('My Hobbies')),
        backgroundColor: Colors.grey,
        body: const Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                title: 'Travelling',
                icon: Icons.travel_explore,
                color: Colors.green,
              ),
              SizedBox(height: 10),
              HobbyCard(
                title: 'Skating',
                icon: Icons.sports_hockey,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(icon, color: Colors.white),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
