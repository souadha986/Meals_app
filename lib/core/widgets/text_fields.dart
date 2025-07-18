import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styling/app_colors.dart';

class Fields extends StatelessWidget {
  final TextEditingController? controller;

  const Fields({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 331.w,
      child: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: AppColors.primaryColor,
          ),
        ),
        child: TextFormField(
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Color(0xFFE8ECF4), width: 1.w),
            ),
            fillColor: Color(0xFFFFFFFF),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Color(0xFFE8ECF4), width: 1.w),
            ),
          ),
        ),
      ),
    );
  }
}
