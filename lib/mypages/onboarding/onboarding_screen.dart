import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/assets/app_images.dart';
import 'package:meals_app/core/navigation/app_routes.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/font_style.dart';
import 'package:meals_app/mypages/onboarding/onboarding_services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //we put here the varables that change when we set state
  int currentindex = 0;
  List<String> titles = [
    "Save Your Meals Ingredient",
    "Use Our App The Best Choice",
    " Our App Your Ultimate Choice",
  ];
  List<String> descriptions = [
    "Add Your Meals and its Ingredients and we will save it for you",
    "the best choice for your kitchen do not hesitate",
    " All the best restaurants and their top menus are ready for you",
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool isFirstTime = OnBoardingServices.isFirstTime();

      OnBoardingServices.setFirstTimeWithFalse();
      if (isFirstTime == false) {
        GoRouter.of(context).pushReplacementNamed(AppRoutes.home);
      }
    });

    super.initState();
  }

  CarouselSliderController carouselController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Image.asset(
              AppImages.idk,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 16.h,
            right: 32.w,
            left: 32.w,
            child: Container(
              width: 311.w,
              height: 400.w,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColors.primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(48.r),
              ),
              child: Column(
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      //scrollPhysics: NeverScrollableScrollPhysics(),
                      height: 275.h,

                      viewportFraction: 0.9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentindex = index;
                        });
                      },
                    ),
                    items: List.generate(titles.length, (index) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: 252.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 32.h),
                                SizedBox(
                                  width: 230.w,
                                  child: Text(
                                    titles[index],
                                    style: Fontstyle.bigwhithfontStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                SizedBox(
                                  width: 251.w,
                                  child: Text(
                                    descriptions[index],
                                    style: Fontstyle.smallwhithfontstyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 8.h),
                  DotsIndicator(
                    dotsCount: 3,
                    position: currentindex.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: AppColors.whiteColor,
                      color: Color(0xffC2C2C2),
                      size: const Size(24, 6),
                      activeSize: const Size(24, 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  currentindex < 2
                      ? SizedBox(height: 70.h)
                      : SizedBox(height: 40.h),
                  currentindex < 2
                      ? Row(
                          children: [
                            SizedBox(width: 32.w),
                            InkWell(
                              onTap: () {
                                context.pushReplacement(AppRoutes.home);
                              },
                              child: Text(
                                "skip",
                                style: Fontstyle.smallwhithfontstyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            SizedBox(width: 185.w),
                            InkWell(
                              onTap: () {
                                carouselController.nextPage();
                              },
                              child: Text(
                                "Next",
                                style: Fontstyle.smallwhithfontstyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 32.w),
                          ],
                        )
                      : Container(
                          alignment: Alignment.center,
                          height: 62.h,
                          width: 62.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              context.pushReplacement(AppRoutes.home);
                            },
                            icon: Icon(
                              Icons.arrow_forward_outlined,
                              color: AppColors.primaryColor,
                              size: 24.w,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
