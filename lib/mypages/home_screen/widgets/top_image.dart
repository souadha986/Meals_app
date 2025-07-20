import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/assets/app_images.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/font_style.dart';

class TopImage extends StatelessWidget {
  const TopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.salade,
          width: double.infinity,
          height: 250.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 42.h,
          left: 54.w,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 8.w),
            width: 190.w,
            height: 186.h,

            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: AppColors.primaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(48.r),
            ),

            child: Text(
              "Welcome Add A New Recipe",
              style: Fontstyle.bigwhithfontStyle,
            ),
          ),
        ),
      ],
    );
  }
}
