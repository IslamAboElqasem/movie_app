import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/Core/theme/cubit/theme_cubit.dart';
import 'package:movie_app/Features/home/data/data_sources/movie_api_service.dart';
import 'package:movie_app/Features/home/data/repo/movie_repository_impl.dart';
import 'package:movie_app/Features/home/presentation/cubits/get_popular_movie/get_popular_movie_cubit.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Dio
  sl.registerLazySingleton(() => Dio());

  // API Service
  sl.registerLazySingleton(() => MovieApiService(sl()));

  // Repository
  sl.registerLazySingleton(() => MovieRepositoryImpl(sl()));
  // Register Cubits
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

  sl.registerFactory<GetPopularMovieCubit>(
    () => GetPopularMovieCubit(sl()),
  );
}
