import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/navigation/router_generator.dart';
import 'package:meals_app/mypages/onboarding/onboarding_services.dart';

void main() async {
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
          routerConfig: RouterGenerator.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
