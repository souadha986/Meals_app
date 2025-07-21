import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/font_style.dart';
import 'package:meals_app/mypages/home_screen/data/models/meal.dart';

class MealsDetails extends StatelessWidget {
  final Meal meal;
  const MealsDetails({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, color: Colors.red),
                        imageUrl: meal.imageUrl,

                        width: 359.w,
                        height: 327.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 11.w,
                      top: 17.h,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: () => context.pop(),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.whiteColor,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.name,
                      style: Fontstyle.smallblacktitles.copyWith(
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(height: 21.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      width: 327.w,
                      height: 33.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.primaryColor.withOpacity(0.04),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_clock,
                            size: 16.sp,
                            color: AppColors.primaryColor,
                          ),
                          Text(meal.time, style: Fontstyle.greytitle),
                          SizedBox(width: 203.w),

                          Icon(
                            Icons.star,
                            size: 16.sp,
                            color: AppColors.primaryColor,
                          ),
                          Text(
                            meal.rate.toString(),
                            style: Fontstyle.greytitle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35.h),
                    Divider(thickness: 2, color: Color(0xffEDEDED)),
                    SizedBox(height: 24.h),
                    Text("Description", style: Fontstyle.smallblacktitles),
                    SizedBox(height: 8.h),
                    Text(meal.description, style: Fontstyle.greytitle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
