import 'package:get_it/get_it.dart';
import 'package:movie_app/Core/theme/cubit/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Register Cubits
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}
