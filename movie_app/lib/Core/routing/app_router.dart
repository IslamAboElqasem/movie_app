import 'package:flutter/material.dart';
import 'package:movie_app/Core/routing/routes.dart';

class AppRouter {
  static const String initialRoute = '/';

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
      // return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
