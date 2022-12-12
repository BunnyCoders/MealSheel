import 'package:flutter/material.dart';
import 'package:meal_sheal/views/home/views/menu_tab/view.dart';
import 'package:meal_sheal/views/home/views/more_tab/view.dart';
import 'package:meal_sheal/views/home/views/offers_tab/view.dart';
import 'package:meal_sheal/views/home/views/profile_tab/view.dart';
import 'package:meal_sheal/views/onboarding/view.dart';
import 'package:meal_sheal/views/reset_password/view_model.dart';

import '../views/change_password/view.dart';
import '../views/home/view.dart';
import '../views/login/view.dart';
import '../views/otp/view.dart';
import '../views/reset_password/view.dart';
import '../views/signup/view.dart';
import '../views/splash/view.dart';

// all the route paths in the application
class RoutePaths {
  static const String changePassword = '/changePassword';
  static const String home = '/home';
  static const String login = '/login';
  static const String onboarding = '/onboarding';
  static const String otp = '/otp';
  static const String processing = '/processing';
  static const String resetPassword = '/resetPassword';
  static const String splash = '/splash';
  static const String signup = '/signup';
  static const String menuTab = '/menuTab';
  static const String moreTab = '/moreTab';
  static const String offersTab = '/offersTab';
  static const String profileTab = '/profileTab';
}

// routing logic
class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.changePassword:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordView(),
        );
      case RoutePaths.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case RoutePaths.login:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case RoutePaths.otp:
        return MaterialPageRoute(
          builder: (_) => const OtpView(),
        );
      case RoutePaths.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case RoutePaths.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordView(),
        );
      case RoutePaths.signup:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
        );
      case RoutePaths.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
        // Tabs
      case RoutePaths.menuTab:
        return MaterialPageRoute(
          builder: (_) => const MenuTabView(),
        );
      case RoutePaths.moreTab:
        return MaterialPageRoute(
          builder: (_) => const MoreTabView(),
        );
      case RoutePaths.offersTab:
        return MaterialPageRoute(
          builder: (_) => const OffersTabView(),
        );
      case RoutePaths.profileTab:
        return MaterialPageRoute(
          builder: (_) => const ProfileTabView(),
        );
    }

    return MaterialPageRoute(
      // builder: (_) => PageNotFound(),
      builder: (_) => const Text(
        'Replace with page not found',
      ),
    );
  }
}

// argument classes, data can be only passed between two views using these objects

// class PasswordArgument {
//   String apiTrigger;
//   String? label;
//   ProcessingData processingData;

//   PasswordArgument({
//     required this.apiTrigger,
//     this.label,
//     required this.processingData,
//   });
// }

// class ProcessingArgument {
//   String apiTrigger;
//   String pinCode;
//   ProcessingData processingData;

//   ProcessingArgument({
//     required this.apiTrigger,
//     required this.processingData,
//     required this.pinCode,
//   });
// }

class MessageArgument {
  String message;

  MessageArgument({
    required this.message,
  });
}

class HomeViewArgument {
  int? selectedPage;

  HomeViewArgument({this.selectedPage});
}
