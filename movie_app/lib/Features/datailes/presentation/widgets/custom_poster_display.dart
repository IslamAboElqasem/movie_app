import 'package:cached_network_image/cached_network_image.dart';
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
      child: CachedNetworkImage(
        imageUrl: posterPath,
        height: height.h,
        width: width.w,
        fit: BoxFit.cover,

        // اثناء التحميل
        placeholder: (context, url) => Container(
          height: height.h,
          width: width.w,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),

        // في حالة الفشل
        errorWidget: (context, url, error) => Container(
          height: height.h,
          width: width.w,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: const Icon(Icons.image_not_supported),
        ),
      ),
    );
  }
}
