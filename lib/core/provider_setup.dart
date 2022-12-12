import 'package:meal_sheal/views/change_password/view_model.dart';
import 'package:meal_sheal/views/home/view_model.dart';
import 'package:meal_sheal/views/home/views/menu_tab/view_model.dart';
import 'package:meal_sheal/views/home/views/more_tab/view_model.dart';
import 'package:meal_sheal/views/home/views/offers_tab/view_model.dart';
import 'package:meal_sheal/views/home/views/profile_tab/view_model.dart';
import 'package:meal_sheal/views/login/view_model.dart';
import 'package:meal_sheal/views/onboarding/view_model.dart';
import 'package:meal_sheal/views/otp/view_model.dart';
import 'package:meal_sheal/views/reset_password/view_model.dart';
import 'package:meal_sheal/views/signup/view_model.dart';
import 'package:meal_sheal/views/splash/view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// splitting providers into 2 arrays, as there is an error in iphone if we load more than 150+ providers at the same time
List<SingleChildWidget> providers = [
  // Screens
  ChangeNotifierProvider.value(
    value: ChangePasswordViewModel(),
  ),
  ChangeNotifierProvider.value(
    value: HomeViewModel(),
  ),
  ChangeNotifierProvider.value(
    value: LoginViewModel(),
  ),
  ChangeNotifierProvider.value(
    value: OnboardingViewModel(),
  ),
  ChangeNotifierProvider.value(
    value: OtpViewModel(),
  ),
  ChangeNotifierProvider.value(
    value: ResetPasswordViewModel(),
  ),
  ChangeNotifierProvider.value(
    value: SignUpViewModel(),
  ),
  ChangeNotifierProvider.value(
    value: SplashViewModel(),
  ),

  //Tabs
  ChangeNotifierProvider.value(
    value: MenuTabViewModel(),
  ),
  ChangeNotifierProvider.value(
    value: MoreTabViewModel(),
  ),
  ChangeNotifierProvider.value(
    value: OffersTabViewModel(),
  ),
  ChangeNotifierProvider.value(
    value: ProfileTabViewModel(),
  ),
];
