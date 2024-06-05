import 'package:flutter/material.dart';
import 'package:meal_sheal/views/home/views/home_tab/view.dart';
import 'package:meal_sheal/views/home/views/menu_tab/view.dart';
import 'package:meal_sheal/views/home/views/more_tab/view.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/about_us/view.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/inbox/view.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/my_orders/view.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/my_orders/views/change_address/view.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/my_orders/views/checkout/view.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/notifications/view.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/payment_details/view.dart';
import 'package:meal_sheal/views/home/views/offers_tab/view.dart';
import 'package:meal_sheal/views/home/views/profile_tab/view.dart';
import 'package:meal_sheal/views/onboarding/view.dart';

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
  static const String homeTab = '/homeTab';
  static const String menuTab = '/menuTab';
  static const String moreTab = '/moreTab';
  static const String offersTab = '/offersTab';
  static const String profileTab = '/profileTab';
  static const String aboutUs = '/aboutUs';
  static const String inbox = '/inbox';
  static const String notifications = '/notifications';
  static const String myOrders = '/myOrders';
  static const String paymentDetails = '/payment_details';
  static const String checkout = '/checkout';
  static const String changeAddress = '/changeAddress';
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
      case RoutePaths.homeTab:
        return MaterialPageRoute(
          builder: (_) => const HomeTabView(),
        );
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
      //More Tabs
      case RoutePaths.aboutUs:
        return MaterialPageRoute(
          builder: (_) => const AboutUsView(),
        );
      case RoutePaths.inbox:
        return MaterialPageRoute(
          builder: (_) => const InboxView(),
        );
      case RoutePaths.notifications:
        return MaterialPageRoute(
          builder: (_) => const NotificationsView(),
        );
      case RoutePaths.myOrders:
        return MaterialPageRoute(
          builder: (_) => const MyOrdersView(),
        );
      case RoutePaths.paymentDetails:
        return MaterialPageRoute(
          builder: (_) => const PaymentDetailsView(),
        );
      case RoutePaths.checkout:
        return MaterialPageRoute(
          builder: (_) => const CheckoutView(),
        );
      case RoutePaths.changeAddress:
        return MaterialPageRoute(
          builder: (_) => const ChangeAddressView(),
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
