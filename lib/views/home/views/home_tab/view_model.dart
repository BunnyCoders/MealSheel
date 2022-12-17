import 'package:flutter/material.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/share_data_view_model.dart';

class HomeTabViewModel extends ChangeNotifier {
  final SharedDataViewModel _sharedDataViewModel =
      locator<SharedDataViewModel>();

  List<String> get imagesPaths {
    return _imagesPaths;
  }

  List<String> get popularRestaurantsImagesPaths {
    return _popularRestaurantsImagesPaths;
  }
  List<String> get popularRestaurantsNames {
    return _popularRestaurantsNames;
  }

  List<String> get catNames {
    return _catNames;
  }

  final List<String> _imagesPaths = [
    "assets/images/mexican.jpg",
    "assets/images/italian.jpg",
    "assets/images/indian.jpg",
    "assets/images/srilankan.jpg",
    "assets/images/french.jpeg",
  ];

  final List<String> _popularRestaurantsImagesPaths = [
    "assets/images/p1.jpeg",
    "assets/images/p2.jpeg",
    "assets/images/p3.jpeg",
    "assets/images/p4.jpeg",
    "assets/images/p5.jpeg",
    "assets/images/p6.jpeg",
  ];
  final List<String> _popularRestaurantsNames = [
    "Minutes by tuk tuk",
    "Rajoriya",
    "Sagar Gaire",
    "Raj Villas",
    "Zam Zam fast food",
    "Manohar",
  ];

  final List<String> _catNames = [
    "mexican",
    "italian",
    "indian",
    "sri lankan",
    "french",
  ];
}
