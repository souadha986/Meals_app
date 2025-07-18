import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/core/styling/app_colors.dart';

class Fontstyle {
  static TextStyle bigwhithfontStyle = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 32.sp,
      color: AppColors.whithColor,
      fontWeight: FontWeight.w600,
    ),
  );
  static TextStyle smallwhithfontstyle = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 14.sp,
      color: AppColors.whithColor,
      fontWeight: FontWeight.w400,
    ),
  );
  static TextStyle smallblacktitles = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 16.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600,
    ),
  );
  static TextStyle moresmallblacktitles = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 14.sp,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w500,
    ),
  );
  static TextStyle greytitle = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 14.sp,
      color: AppColors.greyColor,
      fontWeight: FontWeight.w400,
    ),
  );
}
