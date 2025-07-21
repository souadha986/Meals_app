import 'package:go_router/go_router.dart';
import 'package:meals_app/core/navigation/app_routes.dart';
import 'package:meals_app/mypages/add_meal/add_meal.dart';
import 'package:meals_app/mypages/home_screen/data/models/meal.dart';
import 'package:meals_app/mypages/home_screen/home.dart';
import 'package:meals_app/mypages/meals_details/meals-details.dart';
import 'package:meals_app/mypages/onboarding/onboarding_screen.dart';

class RouterGenerator {
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => Home(),
      ),
      GoRoute(
        path: AppRoutes.addmeal,
        name: AppRoutes.addmeal,
        builder: (context, state) => AddMeal(),
      ),
      GoRoute(
        path: AppRoutes.mealsdetails,
        name: AppRoutes.mealsdetails,
        builder: (context, state) {
          Meal meal = state.extra as Meal;
          return MealsDetails(meal: meal);
        },
      ),
    ],
    initialLocation: AppRoutes.onboarding,
  );
}
