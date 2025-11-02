import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/theme/app_colors.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String title;
  final double rating;
  final String genre;

  const MovieDetailsScreen({
    super.key,
    required this.title,
    required this.rating,
    required this.genre,
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
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 250.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: const Icon(Icons.image_not_supported, size: 60),
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
            Text(
              'Description',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 6.h),
            Text(
              'A computer programmer discovers that reality as he knows it is a simulation created by machines.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
