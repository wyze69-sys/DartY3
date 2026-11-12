import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        backgroundColor: Colors.blue,
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    ),
  );
}

enum Product {
  dart('Dart', 'The best object language', 'assets/ex3/dart.png'),
  flutter(
    'Flutter',
    'The best mobile widget library',
    'assets/ex3/flutter.png',
  ),
  firebase('Firebase', 'The best cloud database', 'assets/ex3/firebase.png');

  final String title;
  final String description;
  final String image;

  const Product(this.title, this.description, this.image);
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image, width: 60, height: 60),
            const SizedBox(height: 8),
            Text(product.title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 4),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
