import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/font_style.dart';

class Buttoms extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final TextStyle? textstyle;
  final String? title;
  final Color? backgroundcolor;

  final void Function() onPress;
  const Buttoms({
    super.key,
    this.title,
    this.backgroundcolor,
    this.height,
    this.width,
    this.radius,
    this.textstyle,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundcolor ?? AppColors.primaryColor,
        fixedSize: Size(width ?? 327.w, height ?? 52.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 100.r),
        ),
      ),
      child: Text(
        title ?? "",
        style:
            textstyle ?? Fontstyle.bigwhithfontStyle.copyWith(fontSize: 14.sp),
      ),
    );
  }
}
