import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/navigation/app_routes.dart';

import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/font_style.dart';
import 'package:meals_app/mypages/home_screen/data/db_helper/db_halper.dart';
import 'package:meals_app/mypages/home_screen/data/models/meal.dart';
import 'package:meals_app/mypages/home_screen/widgets/food_item.dart';
import 'package:meals_app/mypages/home_screen/widgets/top_image.dart';

DatabaseHelper db = DatabaseHelper.instance;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Expanded(
            child: FutureBuilder<List<Meal>>(
              future: db.getMeals(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No meals,Add your first meal."),
                  );
                }

                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 46.w,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Meal meal = snapshot.data![index];
                    return FoodItem(
                      imageUrl: meal.imageUrl,
                      name: meal.name,
                      rate: meal.rate,
                      time: meal.time,
                      onTap: () {
                        context.push(AppRoutes.mealsdetails, extra: meal);
                      },
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Delete Recipe"),
                              content: Text(
                                "Are you sure you want to delete this recipe?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    db.dletemeal(meal);
                                    context.pop();
                                    setState(() {});
                                  },
                                  child: Text(
                                    "Delete",
                                    style: Fontstyle.itemtitles.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: Fontstyle.itemtitles.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: Colors.white, size: 30.sp),
        onPressed: () {
          context.push(AppRoutes.addmeal);
        },
      ),
    );
  }
}
