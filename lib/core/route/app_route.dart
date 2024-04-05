import 'package:flutter/material.dart';
import 'package:cinetix/core/route/app_route_name.dart';
import 'package:cinetix/feature/home/home_screen.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
    }
    return null;
  }
}
