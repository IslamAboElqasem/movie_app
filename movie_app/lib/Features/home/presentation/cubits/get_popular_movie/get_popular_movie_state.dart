part of 'get_popular_movie_cubit.dart';

abstract class GetPopularMovieState {}

class MoviesInitial extends GetPopularMovieState {}

class MoviesLoading extends GetPopularMovieState {}

class MoviesLoaded extends GetPopularMovieState {
  final List<MovieModel> movies;
  MoviesLoaded(this.movies);
}

class MoviesError extends GetPopularMovieState {
  final String message;
  MoviesError(this.message);
}
