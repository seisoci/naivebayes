import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naivebayes/routes/app_route_constants.dart';

import '../api/anime_api.dart';
import '../widgets/anime_tile_backup.dart';

class AnimeScreen extends StatefulWidget {
  const AnimeScreen({super.key});

  @override
  State<AnimeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AnimeScreen> {
  @override
  void initState() {
    AnimeApi.fetchAnimes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AnimeApi.fetchAnimes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data != null) {
          final animes = snapshot.data!;

          return Scaffold(
            appBar: AppBar(title: const Text('Animes List')),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: ListView.builder(
                itemCount: animes.length,
                itemBuilder: (context, index) {
                  final anime = animes.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (_) => AnimeDetailScreen(
                      //       anime: anime,
                      //     ),
                      //   ),
                      // );
                      context.goNamed(RouteConstants.detailRouteName, extra: anime);
                    },
                    child: AnimeTile(anime: anime),
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
