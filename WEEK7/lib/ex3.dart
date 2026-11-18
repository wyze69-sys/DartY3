import 'package:flutter/material.dart';

const List<String> images = [
  'assets/w4-s2/bird.jpg',
  'assets/w4-s2/bird2.jpg',
  'assets/w4-s2/insect.jpg',
  'assets/w4-s2/girl.jpg',
  'assets/w4-s2/man.jpg',
];

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ImageGallery(),
      ),
    );

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int _currentIndex = 0;

  void _previousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + images.length) % images.length;
    });
  }

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: _previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: _nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[_currentIndex]),
    );
  }
}
