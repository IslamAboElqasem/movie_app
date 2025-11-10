import 'package:dio/dio.dart';
import 'package:movie_app/Features/home/data/models/movie_model.dart';

class MovieApiService {
  final Dio dio;

  MovieApiService(this.dio);

  static const String baseUrl = 'https://api.themoviedb.org/3/movie/popular';
  static const String token =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NjliNzY0MTljMmU2NmVhZGJhMGE5NTViNmVjMDdjNCIsIm5iZiI6MTc2MjAxMzM1NS4xMzEsInN1YiI6IjY5MDYzMGFiNjMxMDdlZGQxYWRkN2ViOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6uLyFYH7zZy2lA-uuN0_gLndjXVYRCaE-fEtXt5ol4E';

  Future<List<MovieModel>> getPopularMovie({int page = 1}) async {
    final response = await dio.get(baseUrl,
        queryParameters: {
          "language": "en-US",
          "page": page,
        },
        options: Options(headers: {
          'Authorization': token,
          'accept': 'application/json',
        }));

    final List results = response.data['results'];
    return results.map((movie) => MovieModel.fromJson(movie)).toList();
  }
}
