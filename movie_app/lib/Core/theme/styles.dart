import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  //Light Text Styles for Home Screen

// Movie Title
  static TextStyle movieTitle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF000000),
  );

// Rating Text (e.g., "8.7/10")
  static TextStyle ratingText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF000000),
  );

// Genre Chip Text (e.g., "Drama")
  static TextStyle chipText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF000000),
  );

// “Load More Movies” Button Text
  static TextStyle buttonText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF9F9F9F),
  );

//Light Text Styles for Detail Screen

// AppBar Title
  static TextStyle appBarTitle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white, // Blue title
  );

// Movie Title
  static TextStyle detailsTitleLight = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'SF Pro Display',
    color: const Color(0xFF000000),
  );

// Rating Text
  static TextStyle detailsRatingTextLight = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF000000),
  );

// Genre Chip Text
  static TextStyle detailsChipTextLight = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF000000),
  );

// Description Header
  static TextStyle descriptionHeaderLight = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF000000),
  );

// Description Text
  static TextStyle descriptionTextLight = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF646464),
  );

  /// Dark Text Styles

// AppBar Title
  static TextStyle appBarTitleDark = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF00BCD4),
  );

// Movie Title
  static TextStyle movieTitleDark = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFFFFFF),
  );

// Rating Text
  static TextStyle ratingTextDark = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFFFFFFFF),
  );

// Genre Chip Text
  static TextStyle chipTextDark = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFFFFFFFF),
  );

// “Load More Movies” Button Text
  static TextStyle buttonTextDark = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF9F9F9F),
  );

//Dark Text Styles for Detail Screen
// Movie Title
  static TextStyle detailsTitle = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'SF Pro Display',
    color: const Color(0xFFFFFFFF),
  );

// Description Header
  static TextStyle descriptionHeader = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'SF Pro Display',
    color: const Color(0xFFFFFFFF),
  );

// Description Text
  static TextStyle descriptionText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display',
    color: const Color(0xFFB0B0B0),
  );
}
