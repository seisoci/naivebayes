import 'package:flutter/material.dart';

import '../models/heroes.dart';

class HeroDetailScreen extends StatelessWidget {
  final Heroes hero;

  const HeroDetailScreen({
    super.key,
    required this.hero,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Full-screen image at the top
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(hero.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Padding between image and info
            const SizedBox(height: 10),
            // Movie information
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    hero.nama,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Text(
                    hero.deskripsi,
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Other information (you can add more fields here)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieInfoItem extends StatelessWidget {
  final String title;
  final String info;

  const MovieInfoItem({
    super.key,
    required this.title,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bold title
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        // Grayed out info
        Text(
          info,
          style: const TextStyle(
            color: Colors.black38, // Slightly grayed out color
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
