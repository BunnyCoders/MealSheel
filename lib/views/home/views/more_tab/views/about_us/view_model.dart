import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:geolocator/geolocator.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/share_data_layer.dart';

class AboutUsViewModel extends ChangeNotifier {
  final SharedDataLayer _sharedDataLayer = locator<SharedDataLayer>();

  String? _currentAddress;
  Position? _currentPosition;
  List<Placemark>? placemarks;

  get currentAddress {
    return _currentAddress;
  }

  get currentPosition {
    return _currentPosition;
  }

  _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _sharedDataLayer.showToastMessage(
          'Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _sharedDataLayer.showToastMessage('Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _sharedDataLayer.showToastMessage(
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      log(_currentPosition!.latitude.toString());
      log(_currentPosition!.longitude.toString());
      notifyListeners();
      _getAddressFromLatLng();
    }).catchError((e) {
      debugPrint(e);
    });
  }

  _getAddressFromLatLng() async {
    placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude);
    notifyListeners();
    log(placemarks![0].street.toString());

    // print("${first.featureName} : ${first.addressLine}");
  }
  
}


