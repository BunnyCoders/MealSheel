
import 'package:flutter/material.dart';
import 'package:meal_sheal/views/splash/view.dart';
import 'package:provider/provider.dart';

import 'core/locator.dart';
import 'core/provider_setup.dart';
import 'core/router.dart';

Future<void> main() async {
  setupLocator();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  // get locale => context.locale;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Meal Sheal',
        home: const SplashView(),
        initialRoute: RoutePaths.splash,
        onGenerateRoute: MyRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
      ),
    );
  }
}
