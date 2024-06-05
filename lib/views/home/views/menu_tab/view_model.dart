import 'package:flutter/material.dart';
import 'package:meal_sheal/core/models/categories_data_model.dart';
import 'package:meal_sheal/core/models/products_data_model.dart';

import '../../../../core/locator.dart';
import '../../../../core/share_data_layer.dart';

class MenuTabViewModel extends ChangeNotifier {
  final SharedDataLayer _sharedDataLayer = locator<SharedDataLayer>();
  bool _isLoading = false;
  get isLoading {
    return _isLoading;
  }

  ProductsDataModel _products = ProductsDataModel();
  CategoriesDataModel _categories = CategoriesDataModel();

  ProductsDataModel get products {
    return _products;
  }

  CategoriesDataModel get categories {
    return _categories;
  }

  Future<void> getProducts({
    required BuildContext context,
  }) async {
    _products = await _sharedDataLayer.apiService.getProducts();
  }

  Future<void> getCategories({
    required BuildContext context,
  }) async {
    _categories = await _sharedDataLayer.apiService.getCategories();
  }

  void init({required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();

    await getProducts(context: context);
    await getCategories(context: context);

    _isLoading = false;
    notifyListeners();
  }
}
