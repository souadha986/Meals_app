import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:meals_app/core/styling/font_style.dart';
import 'package:meals_app/mypages/home_screen/widgets/top_image.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopImage(),
            SizedBox(height: 28.h),
            Padding(
              padding: EdgeInsets.only(left: 13.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Your Food", style: Fontstyle.smallblacktitles),
              ),
            ),
            SizedBox(height: 33.h),
          ],
        ),
      ),
    );
  }
}
