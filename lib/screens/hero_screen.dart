import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naivebayes/routes/app_route_constants.dart';

import '../api/heroes_api.dart';
import '../widgets/hero_tile.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key});

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  @override
  void initState() {
    HeroApi.fetchHeroes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HeroApi.fetchHeroes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(backgroundColor: Colors.transparent),
          );
        }

        if (snapshot.data != null) {
          final heroes = snapshot.data!;

          return Scaffold(
            appBar: AppBar(title: const Text('Daftar Hero')),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: ListView.builder(
                itemCount: heroes.length,
                itemBuilder: (context, index) {
                  final hero = heroes.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      context.goNamed(RouteConstants.detailHeroPageRouteName, extra: hero);
                    },
                    child: HeroTile(hero: hero),
                  );
                },
              ),
            ),
          );
        }

        return Center(
          child: Text(
            snapshot.error.toString(),
          ),
        );
      },
    );
  }
}
