import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/home/data/models/movie_model.dart';
import 'package:movie_app/Features/home/data/repo/movie_repository_impl.dart';

part 'get_popular_movie_state.dart';

class GetPopularMovieCubit extends Cubit<GetPopularMovieState> {
  final MovieRepositoryImpl movieRepositoryImpl;
  int currentPage = 1;

  GetPopularMovieCubit(this.movieRepositoryImpl) : super(MoviesInitial());

  Future<void> fetchPopularMovies() async {
    try {
      emit(MoviesLoading());
      currentPage = 1;
      final movies =
          await movieRepositoryImpl.getPopularMovies(page: currentPage);
      emit(MoviesLoaded(movies));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }

  Future<void> loadMoreMovies() async {
    try {
      currentPage++;
      final movies =
          await movieRepositoryImpl.getPopularMovies(page: currentPage);
      emit(MoviesLoaded(movies)); // ✅ نرجع كل الأفلام بما فيها الجديد
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }
}
