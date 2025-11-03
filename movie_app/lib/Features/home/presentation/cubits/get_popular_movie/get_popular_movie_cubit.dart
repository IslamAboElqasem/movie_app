import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home/data/models/movie_model.dart';
import 'package:movie_app/Features/home/data/repo/movie_repository_impl.dart';

part 'get_popular_movie_state.dart';

class GetPopularMovieCubit extends Cubit<GetPopularMovieState> {
  final MovieRepositoryImpl movieRepositoryImpl;

  GetPopularMovieCubit(this.movieRepositoryImpl) : super(MoviesInitial());

  Future<void> fetchPopularMovies() async {
    try {
      emit(MoviesLoading());
      final movies = await movieRepositoryImpl.getPopularMovies();
      emit(MoviesLoaded(movies));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }
}
