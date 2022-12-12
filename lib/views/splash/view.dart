import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meal_sheal/views/splash/view_model.dart';
import 'package:provider/provider.dart';

import '../../core/design_system.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashViewModel _viewModel;

  @override
  void didChangeDependencies() {
    Provider.of<SplashViewModel>(
      context,
      listen: false,
    ).startSplash(context: context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.primary,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 160,
            child: Center(
              child: Image(
                width: 160,
                height: 160,
                image: AssetImage(
                  'assets/images/logo.png',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 160,
            child: Text(
              'Meal Sheal',
              style: DSType.h5(
                textColor: DSColors.headingLight,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        ],
      )),
    );
  }
}
