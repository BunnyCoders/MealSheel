import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meal_sheal/components/button.dart';
import 'package:meal_sheal/core/design_system.dart';
import 'package:meal_sheal/views/home/views/more_tab/views/my_orders/views/change_address/view_model.dart';
import 'package:provider/provider.dart';

class ChangeAddressView extends StatefulWidget {
  const ChangeAddressView({super.key});

  @override
  State<ChangeAddressView> createState() => _ChangeAddressViewState();
}

class _ChangeAddressViewState extends State<ChangeAddressView> {
  late ChangeAddressViewModel _viewModel;
  late Completer<GoogleMapController> _controller;
  late GoogleMapController googleMapController;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  late Position currentPostion;
  var geoLocator = Geolocator();
  Set<Marker> _markers = {};
  List<Marker> list = [];
  double bottomPaddingOfMap = 0;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    currentPostion = position;

    LatLng latLangPositon = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = CameraPosition(
      target: latLangPositon,
      zoom: 14,
    );

    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Widget _googleMap() {
    return GoogleMap(
      padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      zoomControlsEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        googleMapController = controller;

        setState(() {
          bottomPaddingOfMap = 265.0;
        });

        locatePosition();
      },
      zoomGesturesEnabled: true,
      markers: Set<Marker>.of(list),
    );
  }

  // Widget _backButton() {
  //   return RoundButton(
  //     iconPath: 'assets/icons/arrow_left_alt.svg',
  //     onTap: () => _viewModel.onTapBack(context: context),
  //   );
  // }

  Widget _bottomButtons() {
    return Container(
      color: Colors.black.withOpacity(0.3),
      padding: const EdgeInsets.all(DSSizes.md),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Button(
            background: DSColors.primary,
            // iconPath: 'assets/icons/location.svg',
            text: "Get My Location",
            textColor: DSColors.headingLight,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _stackWidget() {
    return Stack(
      children: <Widget>[
        Positioned(
          child: _googleMap(),
        ),
        // Positioned(
        //   left: DSSizes.md,
        //   top: DSSizes.xl,
        //   child: _backButton(),
        // ),
        // Positioned(
        //   bottom: 0,
        //   child: _bottomButtons(),
        // ),
      ],
    );
  }

  Widget _buildUI() {
    return _stackWidget();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<ChangeAddressViewModel>(context);

    return Scaffold(
      body: _buildUI(),
    );
  }
}
