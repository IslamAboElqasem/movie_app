import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/datailes/presentation/widgets/custom_poster_display.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final double rating;
  final String genre;
  final String posterPath;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.title,
    required this.rating,
    required this.genre,
    required this.onTap,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            // ✅ صورة الفيلم
            CustomPosterDisplay(posterPath: posterPath, height: 120, width: 85),
            SizedBox(width: 12.w),

            // ✅ بيانات الفيلم
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 4.w),
                      Text(
                        '$rating/10',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                  Chip(label: Text(genre)),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
