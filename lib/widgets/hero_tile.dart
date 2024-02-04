import 'package:flutter/material.dart';

import '../models/heroes.dart';

class HeroTile extends StatelessWidget {
  const HeroTile({
    super.key,
    required this.hero,
  });

  final Heroes hero;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          elevation: 12.0,
          color: const Color(0xFFF6F8FA),
          child: Row(
            children: [
              SizedBox(
                height: 120,
                width: 150,
                child: Image.network(
                  hero.image ?? "-",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hero.nama,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      hero.deskripsi ?? "-",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
