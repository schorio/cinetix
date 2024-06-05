import 'package:cinetix/feature/categorieFilter/categorie_filter_screen.dart';
import 'package:cinetix/feature/enSalle/en_salle_screen.dart';
import 'package:cinetix/feature/plus_film/plus_film_screen.dart';
import 'package:cinetix/feature/prochainement/prochainement_screen.dart';
import 'package:cinetix/feature/reserverfilm/reserverfilm_screen.dart';
import 'package:flutter/material.dart';
import 'package:cinetix/core/route/app_route_name.dart';
import 'package:cinetix/feature/home/home_screen.dart';
import 'package:cinetix/feature/detailsfilm/detailsfilm_screen.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );

      case AppRouteName.detailsFilm:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DetailsFilm(),
          transitionDuration: const Duration(milliseconds: 550),
          reverseTransitionDuration: const Duration(milliseconds: 550),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

      case AppRouteName.reserverFilm:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const ReserverFilm(),
          transitionDuration: const Duration(milliseconds: 550),
          reverseTransitionDuration: const Duration(milliseconds: 550),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

      case AppRouteName.enSalle:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const EnSalle(),
          transitionDuration: const Duration(milliseconds: 550),
          reverseTransitionDuration: const Duration(milliseconds: 550),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

      case AppRouteName.prochainement:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const ProchainementScreen(),
          transitionDuration: const Duration(milliseconds: 550),
          reverseTransitionDuration: const Duration(milliseconds: 550),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

      case AppRouteName.plusFilm:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const PlusFilmScreen(),
          transitionDuration: const Duration(milliseconds: 550),
          reverseTransitionDuration: const Duration(milliseconds: 550),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

      case AppRouteName.categorieFilter:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const CategorieFilterScreen(),
          transitionDuration: const Duration(milliseconds: 550),
          reverseTransitionDuration: const Duration(milliseconds: 550),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
    }
    return null;
  }
}
