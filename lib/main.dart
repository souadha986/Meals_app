import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/navigation/router_generator.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/mypages/home_screen/data/db_helper/db_halper.dart';
import 'package:meals_app/mypages/home_screen/data/models/meal.dart';

import 'package:meals_app/mypages/onboarding/onboarding_services.dart';

void main() async {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  dbHelper.insertMeal(
    Meal(
      name: "pizza",
      imageUrl:
          "https://media.istockphoto.com/id/1442417585/fr/photo/personne-recevant-un-morceau-de-pizza-au-pepperoni-au-fromage.jpg?s=612x612&w=0&k=20&c=xNz2rodZQQARx16BlXTkht9E19aw4ziOMm6UOjW5DKM=",
      description: "delciues",
      time: "20-40",
      rate: 4.9,
    ),
  );
  dbHelper.insertMeal(
    Meal(
      name: "pizza",
      imageUrl:
          "https://media.istockphoto.com/id/1442417585/fr/photo/personne-recevant-un-morceau-de-pizza-au-pepperoni-au-fromage.jpg?s=612x612&w=0&k=20&c=xNz2rodZQQARx16BlXTkht9E19aw4ziOMm6UOjW5DKM=",
      description: "delciues",
      time: "30-40",
      rate: 4.9,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();

  await OnBoardingServices.initializeSharedPrefrencesStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(
            scaffoldBackgroundColor:
                AppColors.whithColor, // 👈 set it here once
          ),
          routerConfig: RouterGenerator.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
