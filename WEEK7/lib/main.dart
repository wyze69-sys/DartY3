import 'package:flutter/material.dart';
import 'ex1.dart';
import 'ex2.dart';
import 'ex3.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Week7Home(),
      ),
    );

class Week7Home extends StatelessWidget {
  const Week7Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('W7 - Stateful Widgets')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Scaffold(
                    appBar: AppBar(title: const Text('Custom buttons')),
                    body: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          SelectableButton(),
                          SelectableButton(),
                          SelectableButton(),
                          SelectableButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              child: const Text('EX 1 - Selectable Button'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      backgroundColor: Colors.blue,
                      title: const Text('Favorite cards'),
                    ),
                    body: const Column(
                      children: [
                        FavoriteCard(isFavorite: true),
                        FavoriteCard(isFavorite: false),
                        FavoriteCard(isFavorite: true),
                      ],
                    ),
                  ),
                ),
              ),
              child: const Text('EX 2 - Favorite Cards'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ImageGallery()),
              ),
              child: const Text('EX 3 - Image Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
