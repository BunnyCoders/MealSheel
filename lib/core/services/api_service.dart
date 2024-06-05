// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/models/categories_data_model.dart';
import 'package:meal_sheal/core/models/products_data_model.dart';
import 'package:xml/xml.dart';

final ApiService apiService = locator<ApiService>();

final headers = {
  'Content-Type': 'text/xml; charset=utf-8',
  'SOAPAction': '#POST',
};

class ApiService {
  late String token = "";

  final String _url = 'http://10.0.2.2:8000/api';

  // postData(data, apiUrl) async {
  //   var fullUrl = _url + apiUrl;
  //   return await http.post(Uri.parse(fullUrl),
  //       body: jsonEncode(data), headers: _setHeaders());
  // }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  setHeadersWithBearerToken(token) => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + token,
      };

  Future<CategoriesDataModel> getCategories() async {
    CategoriesDataModel _categoriesData = CategoriesDataModel();
    try {
      log(Uri.parse("${(_url)}/getCategories").toString());
      final response = await http.get(Uri.parse("${(_url)}/getCategories"));

      if (response.statusCode == 200) {
        // log(response.body.toString());
        return CategoriesDataModel.fromJson(json.decode(response.body));
      } else {
        log("Error while requesting: ${response.body}");

        _categoriesData.errorMessage = json.decode(response.body);
        return _categoriesData;
      }
    } catch (error, stacktrace) {
      log("Exception occured: $error stackTrace: $stacktrace");

      _categoriesData.errorMessage = "Something went wrong";
      return _categoriesData;
    }
  }

  Future<ProductsDataModel> getProducts() async {
    ProductsDataModel _productsData = ProductsDataModel();
    try {
      log(Uri.parse("${(_url)}/getProducts").toString());
      final response = await http.get(Uri.parse("${(_url)}/getProducts"));

      log(response.toString());

      if (response.statusCode == 200) {
        // log(response.body.toString());
        return ProductsDataModel.fromJson(json.decode(response.body));
      } else {
        log("Error while requesting: ${response.body}");

        _productsData.errorMessage = json.decode(response.body);
        return _productsData;
      }
    } catch (error, stacktrace) {
      log("Exception occured: $error stackTrace: $stacktrace");

      _productsData.errorMessage = "Something went wrong";
      // throw Exception('Something went wrong');
      return _productsData;
    }
  }
}

Exception apiExceptionHandler({
  required BuildContext context,
  required Object e,
  bool isTypeOfApiSoap = false,
}) {
  String errorMessage = '';

  if (e is SocketException) {
    errorMessage = 'common_text.no_internet'.tr();
  } else if (e is TimeoutException) {
    errorMessage = 'common_text.timeout'.tr();
  } else if (e is FormatException) {
    errorMessage = isTypeOfApiSoap
        ? 'common_text.system_busy'.tr()
        : 'common_text.session_interrupted'.tr();
  } else {
    errorMessage = 'common_text.something_went_wrong'.tr();
  }

  log(errorMessage);
  showToastMessage(errorMessage);

  return Exception(e);
}

void showToastMessage(String message) {
  Fluttertoast.showToast(
      msg: message, //message to show toast
      toastLength: Toast.LENGTH_LONG, //duration for message to show
      gravity: ToastGravity.BOTTOM_LEFT, //where you want to show, top, bottom
      timeInSecForIosWeb: 1, //for iOS only
      backgroundColor: DSColors.placeHolderDark, //background Color for message
      textColor: DSColors.bodyDark, //message text color
      fontSize: DSSizes.md //message font size
      );
}
