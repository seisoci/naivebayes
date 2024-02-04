import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naivebayes/screens/prediksi_screen.dart';
import '../models/heroes.dart';

import '../screens/splash_screen.dart';
import '../screens/hero_screen.dart';
import '../screens/hero_detail_screen.dart';
import '../screens/dashboard.dart';
import 'app_route_constants.dart';

final router = GoRouter(
  initialLocation: RouteConstants.splashRouteName,
  routes: [
    GoRoute(
      path: RouteConstants.splashRouteName,
      name: RouteConstants.splashRouteName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
        path: "/${RouteConstants.dashboardRouteName}",
        name: RouteConstants.dashboardRouteName,
        builder: (context, state) => const DashboardScreen(),
        routes: [
          GoRoute(
              path: "RouteConstants.heroPageRouteName",
              name: RouteConstants.heroPageRouteName,
              builder: (context, state) => const HeroScreen(),
              routes: [
                GoRoute(
                  path: "RouteConstants.detailHeroPageRouteName",
                  name: RouteConstants.detailHeroPageRouteName,
                  builder: (context, state) {
                    Heroes hero = state.extra as Heroes;
                    return HeroDetailScreen(hero: hero);
                  },
                ),
              ]
          ),
          GoRoute(
            path: "RouteConstants.predictHeroPageRouteName",
            name: RouteConstants.predictHeroPageRouteName,
            builder: (context, state) => const PredictScreen(),
          ),
          // GoRoute(
          //     path: "/${RouteConstants.heroPageRouteName}",
          //     name: RouteConstants.heroPageRouteName,
          //     builder: (context, state) => const HeroScreen(),
          //     routes: [
          //       GoRoute(
          //         path: RouteConstants.detailHeroPageRouteName,
          //         name: RouteConstants.detailHeroPageRouteName,
          //         builder: (context, state) {
          //           Heroes hero = state.extra as Heroes;
          //           return HeroDetailScreen(hero: hero);
          //         },
          //       ),
          // GoRoute(
          //   path: RouteConstants.song,
          //   name: RouteConstants.song,
          //   builder: (context, state) => const SongScreen(),
          //   routes: [
          //     GoRoute(
          //       path: "${RouteConstants.songDetails}/:id",
          //       name: RouteConstants.songDetails,
          //       builder: (context, state) => SongDetailScreen(
          //         id: state.params["id"]!,
          //       ),
          //     ),
          //   ],
          // ),
        ]),
    // GoRoute(
    //   path: "/${RouteConstants.setting}/:name",
    //   name: RouteConstants.setting,
    //   builder: (context, state) {
    //     final name = state.params["name"] ?? "";
    //     UserModel user =
    //     UserModel(name: "default", email: "default@mail.com", id: "0");
    //     if (state.extra is UserModel) {
    //       user = state.extra as UserModel;
    //     }
    //     return SettingScreen(
    //       name: name,
    //       user: user,
    //       query: state.queryParams["query"]!,
    //     );
    //   },
    // ),
    // GoRoute(
    //   path: "/${RouteConstants.login}",
    //   name: RouteConstants.login,
    //   builder: (context, state) => const LoginScreen(),
    // )
  ],
  // errorBuilder: (context, state) => const ErrorScreen(),
);
