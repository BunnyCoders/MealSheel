import 'package:get_it/get_it.dart';
import 'package:meal_sheal/core/services/api_service.dart';
import 'package:meal_sheal/core/share_data_layer.dart';

// this file uses get_it package, this package enables us to implement design patterns like singleton, factory, etc easily
GetIt locator = GetIt.instance;

void setupLocator() {
  // singleton pattern for services as only one instance is required
  locator.registerLazySingleton(() => ApiService());

  // factory pattern for view models
  locator.registerLazySingleton(() => SharedDataLayer());
}
