import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:meal_sheal/core/locator.dart';
import 'package:meal_sheal/core/share_data_layer.dart';

class ChangeAddressViewModel extends ChangeNotifier {
  final SharedDataLayer _sharedDataLayer = locator<SharedDataLayer>();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final String googleApiKey = 'AIzaSyDZkCq-xYAA8nSThMe6xi9fkPjDzFbRZGU';

  List<LatLng> _polylineCoordinates = [];

  get polylineCoordinates {
    return _polylineCoordinates;
  }

  LocationData? _currentLocation;

  get currentLocation {
    return _currentLocation;
  }

  static const LatLng sourceLocation = LatLng(23.2571, 77.4607);
  static const LatLng destination = LatLng(23.2437, 77.4731);

  getLocation() async {
    Location _location = Location();
    _location.getLocation().then((location) => _currentLocation = location);

    _location.onLocationChanged.listen((newLocation) {
      _currentLocation = newLocation;
      notifyListeners();
    });
  }

 
}
