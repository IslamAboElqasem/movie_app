import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/di/service_locator.dart';
import 'package:movie_app/Core/theme/cubit/theme_cubit.dart';
import 'package:movie_app/Core/theme/dark_theme.dart';
import 'package:movie_app/Core/theme/light_theme.dart';
import 'package:movie_app/Features/home/presentation/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = sl<ThemeCubit>();

    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X size (adjust if needed)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider.value(
          value: themeCubit,
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: state.themeMode,
                home: child,
              );
            },
          ),
        );
      },
      child: const HomeScreen(),
    );
  }
}
