import 'package:hive/hive.dart';
import 'package:movie_app/Features/home/data/data_sources/movie_api_service.dart';
import 'package:movie_app/Features/home/data/models/movie_model.dart';

class MovieRepositoryImpl {
  final MovieApiService apiService;

  MovieRepositoryImpl(this.apiService);

  Future<List<MovieModel>> getPopularMovies({int page = 1}) async {
    final box = Hive.box<MovieModel>('moviesBox');

    // أول صفحة: لو فيه كاش رجعه
    if (page == 1 && box.isNotEmpty) {
      return box.values.toList();
    }

    // نطلب الصفحة المطلوبة
    final moviesFromApi = await apiService.getPopularMovie(page: page);

    // نضيفهم للكاش بدون مسح القديم
    await box.addAll(moviesFromApi);

    return box.values.toList(); // ✅ نرجع البيانات كلها لحد اللحظة
  }
}
