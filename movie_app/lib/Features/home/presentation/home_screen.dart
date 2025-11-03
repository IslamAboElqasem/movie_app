import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/helper/extensions.dart';
import 'package:movie_app/Core/routing/routes.dart';
import 'package:movie_app/Core/theme/cubit/theme_cubit.dart';
import 'package:movie_app/Features/home/presentation/widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      {'title': 'The Matrix', 'rating': 8.7, 'genre': 'Sci-Fi'},
      {'title': 'Fight Club', 'rating': 8.8, 'genre': 'Drama'},
      {'title': 'Forrest Gump', 'rating': 8.8, 'genre': 'Drama'},
      {'title': 'The Shawshank Redemption', 'rating': 9.3, 'genre': 'Drama'},
      {'title': 'The Godfather', 'rating': 9.2, 'genre': 'Crime'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.movie_creation_outlined),
            SizedBox(width: 8.w),
            Text('Movies', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state.isDarkMode
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                ),
                onPressed: () => context.read<ThemeCubit>().toggleTheme(),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: movies.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return MovieCard(
                    title: movie['title'] as String,
                    rating: movie['rating'] as double,
                    genre: movie['genre'] as String,
                    onTap: () {
                      context.pushNamed(Routes.detailsMovieScreen, arguments: {
                        'title': movie['title'],
                        'rating': movie['rating'],
                        'genre': movie['genre'],
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Load More Movies'),
            ),
          ],
        ),
      ),
    );
  }
}
