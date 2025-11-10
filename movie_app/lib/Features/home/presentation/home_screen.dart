import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/di/service_locator.dart';
import 'package:movie_app/Core/helper/extensions.dart';
import 'package:movie_app/Core/routing/routes.dart';
import 'package:movie_app/Core/theme/cubit/theme_cubit.dart';
import 'package:movie_app/Features/home/presentation/cubits/get_popular_movie/get_popular_movie_cubit.dart';
import 'package:movie_app/Features/home/presentation/widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ نغلف الشاشة كلها بـ BlocProvider واحد فقط للـ GetPopularMovieCubit
    return BlocProvider(
      create: (_) => sl<GetPopularMovieCubit>()..fetchPopularMovies(),
      child: Scaffold(
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
                child: BlocBuilder<GetPopularMovieCubit, GetPopularMovieState>(
                  builder: (context, state) {
                    if (state is MoviesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MoviesLoaded) {
                      final movie = state.movies;
                      return ListView.separated(
                        itemCount: movie.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          final movie = state.movies[index];
                          return MovieCard(
                            title: movie.title,
                            rating: movie.voteAverage,
                            genre: movie.releaseDate,
                            onTap: () {
                              context.pushNamed(
                                Routes.detailsMovieScreen,
                                arguments: {
                                  'title': movie.title,
                                  'rating': movie.voteAverage,
                                  'genre': movie.releaseDate,
                                  'posterPath': movie.posterPath,
                                  'overView': movie.overview,
                                },
                              );
                            },
                            posterPath: movie.posterPath,
                          );
                        },
                      );
                    } else if (state is MoviesError) {
                      return Center(child: Text('Error: ${state.message}'));
                    }
                    return Center(
                      child: ElevatedButton(
                        onPressed: () => context
                            .read<GetPopularMovieCubit>()
                            .fetchPopularMovies(),
                        child: const Text('Load Movies'),
                      ),
                    );
                  },
                ),
              ),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      context.read<GetPopularMovieCubit>().loadMoreMovies();
                    },
                    child: const Text('Load More Movies'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
