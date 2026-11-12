import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text('Weather Forecast'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WeatherCard(
                city: 'Phnom Penh',
                min: 10,
                max: 30,
                temperature: 12.2,
                image: 'assets/ex4/cloudy.png',
                colors: [Colors.purpleAccent, Colors.deepPurpleAccent],
              ),
              SizedBox(height: 16),
              WeatherCard(
                city: 'Paris',
                min: 10,
                max: 40,
                temperature: 22.2,
                image: 'assets/ex4/sunnyCloudy.png',
                colors: [Colors.tealAccent, Colors.teal],
              ),
              SizedBox(height: 16),
              WeatherCard(
                city: 'Rome',
                min: 10,
                max: 40,
                temperature: 45.2,
                image: 'assets/ex4/sunny.png',
                colors: [Colors.pinkAccent, Colors.pink],
              ),
              SizedBox(height: 16),
              WeatherCard(
                city: 'Toulouse',
                min: 10,
                max: 40,
                temperature: 45.2,
                image: 'assets/ex4/veryCloudy.png',
                colors: [Colors.orangeAccent, Colors.orange],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final String city;
  final double min;
  final double max;
  final double temperature;
  final String image;
  final List<Color> colors;

  const WeatherCard({
    super.key,
    required this.city,
    required this.min,
    required this.max,
    required this.temperature,
    required this.image,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: colors.first,
      elevation: 5,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(gradient: LinearGradient(colors: colors)),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(image, width: 32, height: 32),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Min: ${min.toStringAsFixed(1)}°C',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Max: ${max.toStringAsFixed(1)}°C',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Text(
              '${temperature.toStringAsFixed(1)}°C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
