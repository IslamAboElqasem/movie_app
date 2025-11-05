import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPosterDisplay extends StatelessWidget {
  const CustomPosterDisplay({
    super.key,
    required this.posterPath,
    required this.height,
    required this.width,
  });

  final String posterPath;
  final int height;
  final int width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Image.network(
        posterPath,
        height: height.h,
        width: width.w,
        fit: BoxFit.cover,
        // في حالة فشل التحميل
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 120.h,
            width: 85.w,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: const Icon(Icons.image_not_supported),
          );
        },
        // في حالة التحميل (loading)
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: 120.h,
            width: 85.w,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
      ),
    );
  }
}
