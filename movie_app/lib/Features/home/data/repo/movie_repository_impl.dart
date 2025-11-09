import 'package:hive/hive.dart';
import 'package:movie_app/Features/home/data/data_sources/movie_api_service.dart';
import 'package:movie_app/Features/home/data/models/movie_model.dart';

class MovieRepositoryImpl {
  final MovieApiService apiService;

  MovieRepositoryImpl(this.apiService);

  Future<List<MovieModel>> getPopularMovies() async {
    final box = Hive.box('moviesBox');

    // *** جرب الأول تجيب من الكاش
    final cachedData = box.get('popularMovies');
    if (cachedData != null) {
      // لو الكاش موجود رجعه مباشرة
      final moviesFromCache = (cachedData as List)
          .map((e) => MovieModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      return moviesFromCache;
    }

    // *** لو مفيش كاش: نجيب من الـ API
    final moviesFromApi = await apiService.getPopularMovie();

    // *** نخزن الداتا في الكاش
    box.put(
        'popularMovies',
        moviesFromApi
            .map((e) => {
                  "id": e.id,
                  "title": e.title,
                  "overview": e.overview,
                  "poster_path": e.posterPath
                      .replaceFirst("https://image.tmdb.org/t/p/w500", ''),
                  "vote_average": e.voteAverage,
                  "release_date": e.releaseDate,
                })
            .toList());

    return moviesFromApi;
  }
}
