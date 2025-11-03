import 'package:flutter/material.dart';
import 'package:movie_app/Core/routing/routes.dart';
import 'package:movie_app/Features/datailes/presentation/movie_details_screen.dart';
import 'package:movie_app/Features/home/presentation/home_screen.dart';

class AppRouter {
  static const String initialRoute = '/';

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.detailsMovieScreen:
        return MaterialPageRoute(
          builder: (_) => MovieDetailsScreen(
            title: args is Map<String, dynamic> && args.containsKey('title')
                ? args['title'] as String
                : '',
            rating: args is Map<String, dynamic> && args.containsKey('rating')
                ? args['rating'] as double
                : 0.0,
            genre: args is Map<String, dynamic> && args.containsKey('genre')
                ? args['genre'] as String
                : '',
          ),
        );
      default:
        return null;
    }
  }
}
