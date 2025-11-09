import 'package:hive/hive.dart';
import 'package:movie_app/Features/home/data/data_sources/movie_api_service.dart';
import 'package:movie_app/Features/home/data/models/movie_model.dart';

class MovieRepositoryImpl {
  final MovieApiService apiService;

  MovieRepositoryImpl(this.apiService);

  Future<List<MovieModel>> getPopularMovies() async {
    final box = Hive.box<MovieModel>('moviesBox');

    // ✅ لو فيه كاش رجعه
    if (box.isNotEmpty) {
      return box.values.toList();
    }

    // ✅ لو مفيش كاش روح للـ API
    final moviesFromApi = await apiService.getPopularMovie();

    // ✅ خزّن مباشرة كـ Models
    await box.addAll(moviesFromApi);

    return moviesFromApi;
  }
}
