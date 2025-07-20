import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/navigation/app_routes.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/font_style.dart';
import 'package:meals_app/core/widgets/buttoms.dart';
import 'package:meals_app/core/widgets/text_fields.dart';
import 'package:meals_app/mypages/home_screen/data/db_helper/db_halper.dart';
import 'package:meals_app/mypages/home_screen/data/models/meal.dart';

DatabaseHelper db = DatabaseHelper.instance;

class AddMeal extends StatefulWidget {
  const AddMeal({super.key});

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController mealNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Add Meal", style: Fontstyle.smallblacktitles),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: isLoading == true
                  ? SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: SizedBox(
                          width: 40.sp,
                          height: 40.sp,
                          child: const CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 28.h),
                        Text(
                          "Meal Name",
                          style: Fontstyle.moresmallblacktitles,
                        ),
                        SizedBox(height: 12.h),
                        Fields(
                          controller: mealNameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add meal name";
                            } else if (val.length < 3) {
                              return "please add more than 3 characters";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Image URL",
                          style: Fontstyle.moresmallblacktitles,
                        ),
                        SizedBox(height: 12.h),
                        Fields(
                          controller: imageUrlController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add image url ";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.h),
                        Text("Rate", style: Fontstyle.moresmallblacktitles),
                        SizedBox(height: 12.h),
                        Fields(
                          controller: rateController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add rate";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.h),
                        Text("Time", style: Fontstyle.moresmallblacktitles),
                        SizedBox(height: 12.h),
                        Fields(
                          controller: timeController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add Time for Meal";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Description",
                          style: Fontstyle.moresmallblacktitles,
                        ),
                        SizedBox(height: 12.h),
                        Fields(
                          controller: descriptionController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "please add Time for Meal";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 70.h),
                        Buttoms(
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              Meal meal = Meal(
                                name: mealNameController.text,
                                imageUrl: imageUrlController.text,
                                rate: double.parse(rateController.text.trim()),

                                description: descriptionController.text,
                                time: timeController.text,
                              );

                              db.insertMeal(meal).then((value) {
                                context.pushReplacement(AppRoutes.home);
                              });
                            }
                          },
                          title: "Save",
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
