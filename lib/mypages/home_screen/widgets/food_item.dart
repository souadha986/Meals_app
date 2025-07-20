import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/font_style.dart';

class FoodItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double rate;
  final String time;
  final Function()? onTap;
  const FoodItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.rate,
    required this.time,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.sp),
        width: 153.w,
        height: 176.h,
        decoration: BoxDecoration(
          color: AppColors.whithColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: AppColors.blackColor.withOpacity(0.04), // shadow color
              blurRadius: 60,
              spreadRadius: 0,
              offset: Offset(6, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
                imageUrl: imageUrl,
                width: 137.w,
                height: 106.h,

                fit: BoxFit.fill,
              ),
            ),

            SizedBox(
              width: 137.w,
              child: Text(
                name,
                maxLines: 1,
                style: Fontstyle.smallblacktitles.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.star, size: 16.sp, color: AppColors.primaryColor),
                Text(rate.toString(), style: Fontstyle.itemtitles),
                SizedBox(width: 35.w),
                Icon(
                  Icons.lock_clock,
                  size: 16.sp,
                  color: AppColors.primaryColor,
                ),
                Text(time, style: Fontstyle.smallblackfontstylenumbers),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
