import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({super.key, required this.overView});
  final String overView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 6.h),
        Text(
          overView,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
