import 'package:movie_app/Features/home/data/data_sources/movie_api_service.dart';
import 'package:movie_app/Features/home/data/models/movie_model.dart';

class MovieRepositoryImpl {
  final MovieApiService apiService;

  MovieRepositoryImpl(this.apiService);

  Future<List<MovieModel>> getPopularMovies() async {
    return await apiService.getPopularMovie();
  }
}
