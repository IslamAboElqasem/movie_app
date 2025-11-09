import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/theme/app_colors.dart';
import 'package:movie_app/Features/datailes/presentation/widgets/custom_poster_display.dart';

import 'widgets/custom_description.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String title;
  final double rating;
  final String genre;
  final String posterPath;
  final String overView;
  const MovieDetailsScreen({
    super.key,
    required this.title,
    required this.rating,
    required this.genre,
    required this.posterPath,
    required this.overView,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Details',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomPosterDisplay(
                  posterPath: posterPath,
                  height: 250,
                  width: 180,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  const Icon(Icons.star, color: AppColors.starColor),
                  SizedBox(width: 4.w),
                  Text(
                    '$rating / 10',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(width: 12.w),
                  Chip(
                    label: Text(genre),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomDescription(
                overView: overView,
              )
            ],
          ),
        ),
      ),
    );
  }
}
