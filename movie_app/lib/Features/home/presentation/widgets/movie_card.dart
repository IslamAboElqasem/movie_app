import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final double rating;
  final String genre;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.title,
    required this.rating,
    required this.genre,
    required this.onTap,
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
            Container(
              height: 120.h,
              width: 85.w,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: const Icon(Icons.image_not_supported),
            ),
            SizedBox(width: 12.w),
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
                      Text('$rating/10',
                          style: Theme.of(context).textTheme.bodyMedium),
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
